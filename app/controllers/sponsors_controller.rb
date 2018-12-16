class SponsorsController < ApplicationController
  before_action :check_permission
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]  

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.all
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    @sponsorships = Sponsorship.joins(:sponsor).where("sponsors.id = ?", @sponsor.id).order("sponsorships.school_year ASC")
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to @sponsor, notice: tr("sponsor_created") }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to @sponsor, notice: tr("sponsor_updated") }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: tr("sponsor_destroyed") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:code, :donor_number, :given_name, :family_name, :link, :street_address, :city, :postal_code, :primary_email, :secondary_email, :primary_phone, :secondary_phone)
    end

    def check_permission
      return if @user && @user.can_access_sponsor?
      return head :unauthorized
    end
end
