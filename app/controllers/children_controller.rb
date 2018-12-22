class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy, :quick_edit_read, :quick_edit_update]
  before_action :check_delete_permission, only: [:destroy]

  # GET /children
  # GET /children.json
  def index
    @children = Child.all.includes(family: [:community]).order(:code)
  end

  # GET /children/1
  # GET /children/1.json
  def show
    @community = @child.try(:family).try(:community)
    @enrollments = Enrollment.joins(:child).where("children.id = ?", @child.id).order("enrollments.school_year ASC")
  end

  # GET /children/new
  def new
    @child = Child.new
    @child.family_id = params[:family_id] if params[:family_id]
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  # POST /children.json
  def create
    cp = child_params
    cp[:code] = cp[:code].strip
    @child = Child.new(cp)

    respond_to do |format|
      begin
        saved =  @child.save
      rescue ActiveRecord::RecordNotUnique => e
        @child.errors[:base] << e.message
        saved = false
      rescue => e
        @child.errors[:base] << e.message
        saved = false
      end
      if saved
        format.html { redirect_to @child, notice: tr('child_created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      begin
        cp = child_params
        cp[:code] = cp[:code].strip
        updated = @child.update(cp)
      rescue ActiveRecord::RecordNotUnique => e
        @child.errors[:base] << e.message
        updated = false
      rescue => e
        @child.errors[:base] << e.message
        updated = false
      end
      if updated
        format.html { redirect_to @child, notice: tr("child_updated")}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    family = @child.family
    @child.destroy
    respond_to do |format|
      format.html { redirect_to family, notice: tr("child_deleted") }
    end
  end

  def quick_edit_read
    enrollment = Enrollment.where(child_id: @child.id).order(school_year: :desc).first
    result = {status: (@child.status), enrollment: (enrollment ? {enrollment.school_year => enrollment.included} : nil)}
    render :json => result
  end

  def quick_edit_update
    status = request["status"]
    if status == "in_program"
      @child.status = "in_program"
    else
      @child.status = "out_of_program"
    end
    begin
      @child.save
    rescue => e
      render json: {}, :status => :internal_server_error
    end

    if @child.status == "in_program"
      included = request["included"]
      enrollment = Enrollment.where(child_id: @child.id).order(school_year: :desc).first
      if enrollment && enrollment.school_year == Time.new.year.to_s
        enrollment.included = included
      else
        enrollment = Enrollment.new
        enrollment.school_year = Time.new.year.to_s
        enrollment.child_id = @child.id
        enrollment.included = included
      end
      begin
        enrollment.save
      rescue => e
        render json: {}, :status => :internal_server_error
      end
    end
    render json: {}, :status => 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:code, :family_id, :notes, :given_name1, :given_name2, :family_name1, :family_name2, :preferred_name, :dob, :status, :gender)
    end
end
