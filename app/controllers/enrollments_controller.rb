class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :check_delete_permission, only: [:destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    @family_year = FamilyYear.where(school_year: @enrollment.school_year).where(family_id: @family.id).first
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
    @enrollment.school_year = Time.new.year.to_s
    @enrollment.child_id = params[:child_id] if params[:child_id]
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
	@enrollment.save
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: tr("enrollment_created") }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    @child = @enrollment.child
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: tr("enrollment_updated") }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    child = @enrollment.child
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to child, notice: tr("enrollment_destroyed") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
      @child = @enrollment.child
      @family = @child.family
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
	
      if @user.can_access_sponsor?
        params.require(:enrollment).permit(:school_year, :child_id, :sponsor_id, :newyear_shirt_size, :newyear_pant_size, :newyear_shoe_size, :midyear_shirt_size, :midyear_pant_size, :midyear_shoe_size, :newyear_attendance, :midyear_attendance, :report_card, :work_form, :midyear_report_card, :midyear_work_form, :pass, :newyear_grade, :midyear_grade, :notes, :letter, :included, :close_up_photo, :full_photo)
      else
        params.require(:enrollment).permit(:school_year, :child_id,              :newyear_shirt_size, :newyear_pant_size, :newyear_shoe_size, :midyear_shirt_size, :midyear_pant_size, :midyear_shoe_size, :newyear_attendance, :midyear_attendance, :report_card, :work_form, :midyear_report_card, :midyear_work_form, :pass, :newyear_grade, :midyear_grade, :notes, :letter, :included, :close_up_photo, :full_photo)
      end
    end
	

end

