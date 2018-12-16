class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  before_action :check_delete_permission, only: [:destroy]
  
  # GET /guardians
  # GET /guardians.json
  def index
    @guardians = Guardian.all.includes(family: [:community]).order("communities.code ASC", "families.name ASC")
  end

  # GET /guardians/1
  # GET /guardians/1.json
  def show
    @family = @guardian.family
  end

  # GET /guardians/new
  def new
    @guardian = Guardian.new()
    @guardian.family_id = params[:family_id] if  params[:family_id]
  end

  # GET /guardians/1/edit
  def edit
  end

  # POST /guardians
  # POST /guardians.json
  def create
    @guardian = Guardian.new(guardian_params)

    respond_to do |format|
      if @guardian.save
        format.html { redirect_to @guardian, notice: tr("guardian_created") }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /guardians/1
  # PATCH/PUT /guardians/1.json
  def update
    respond_to do |format|
      if @guardian.update(guardian_params)
        format.html { redirect_to @guardian, notice: tr("guardian_updated") }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /guardians/1
  # DELETE /guardians/1.json
  def destroy
    family = @guardian.family
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to family, notice: tr("guardian_destroyed") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardian
      @guardian = Guardian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guardian_params
      params.require(:guardian).permit(:family_id, :relationship, :active, :primary, :given_name1, :given_name2, :family_name1, :family_name2, :preferred_name, :primary_phone, :secondary_phone)
    end
end
