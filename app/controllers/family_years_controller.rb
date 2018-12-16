class FamilyYearsController < ApplicationController
  before_action :set_family_year, only: [:show, :edit, :update, :destroy]
  before_action :check_delete_permission, only: [:destroy]

  # GET /family_years
  # GET /family_years.json
  def index
    @family_years = FamilyYear.all.includes(family: [:community]).order("communities.code ASC", "families.name ASC")
  end

  # GET /family_years/1
  # GET /family_years/1.json
  def show
    @family = @family_year.family
    @children = Child.joins(:family).where("families.id = ?", @family.id).order("children.code ASC")
  end

  # GET /family_years/new
  def new
    @family_year = FamilyYear.new
    @family_year.family_id = params[:family_id] if  params[:family_id]
    @family_year.school_year = Time.new.year.to_s
    @family = Family.where(id: @family_year.family_id).first
  end

  # GET /family_years/1/edit
  def edit
    @family = @family_year.family
  end

  # POST /family_years
  # POST /family_years.json
  def create
    @family_year = FamilyYear.new(family_year_params)

    respond_to do |format|
      if @family_year.save
        format.html { redirect_to @family_year, notice: tr("family_year_created") }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /family_years/1
  # PATCH/PUT /family_years/1.json
  def update
    respond_to do |format|
      if @family_year.update(family_year_params)
        format.html { redirect_to @family_year, notice: tr("family_year_updated") }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /family_years/1
  # DELETE /family_years/1.json
  def destroy
    family = @family_year.family
    @family_year.destroy
    respond_to do |format|
      format.html { redirect_to family, notice: tr("family_year_destroyed") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_year
      @family_year = FamilyYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_year_params
      if @user.can_access_interview_notes?
        params.require(:family_year).permit(:community_id, :family_id, :school_year, :picture, :notes)
      else
        params.require(:family_year).permit(:community_id, :family_id, :school_year, :picture)
      end  
    end
end
