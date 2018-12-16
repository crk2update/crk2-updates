class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  before_action :check_delete_permission, only: [:destroy]

  # GET /families
  # GET /families.json
  def index
    @families = Family.all.includes(:community).order("communities.code")
  end

  # GET /families/1
  # GET /families/1.json
  def show
    @community = @family.community
    @children = Child.joins(:family).where("families.id = ?", @family.id).order("children.code ASC")
    @guardians = Guardian.joins(:family).where("families.id = ?", @family.id).order("guardians.family_name1 ASC", "guardians.family_name2 ASC")
    @family_years = FamilyYear.joins(:family).where("families.id = ?", @family.id).order("family_years.school_year ASC")
  end

  # GET /families/new
  def new
    @family = Family.new
    @family.community_id = params[:community_id] if params[:community_id]
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: tr("family_created") }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: tr("family_updated") }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    community = @family.community
    @family.destroy
    respond_to do |format|
      format.html { redirect_to community, notice: tr("family_deleted") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:community_id, :community_code, :notes, :name)
    end
end
