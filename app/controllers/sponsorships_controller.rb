class SponsorshipsController < ApplicationController
  before_action :check_permission
  before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]

  # GET /sponsorships
  # GET /sponsorships.json
  def index
    @sponsorships = Sponsorship.all
  end

  # GET /sponsorships/1
  # GET /sponsorships/1.json
  def show
    @sponsor = @sponsorship.sponsor
  end

  # GET /sponsorships/new
  def new
    @sponsorship = Sponsorship.new
    @sponsorship.sponsor_id = params[:sponsor_id] if params[:sponsor_id]
    @sponsorship.school_year = Time.new.year.to_s
  end

  # GET /sponsorships/1/edit
  def edit
  end

  # POST /sponsorships
  # POST /sponsorships.json
  def create
    @sponsorship = Sponsorship.new(sponsorship_params)

    respond_to do |format|
      if @sponsorship.save
        format.html { redirect_to @sponsorship, notice: tr('sponsorship_created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sponsorships/1
  # PATCH/PUT /sponsorships/1.json
  def update
    respond_to do |format|
      if @sponsorship.update(sponsorship_params)
        format.html { redirect_to @sponsorship, notice: tr('sponsorship_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /sponsorships/1
  # DELETE /sponsorships/1.json
  def destroy
    sponsor = @sponsorship.sponsor
    @sponsorship.destroy
    respond_to do |format|
      format.html { redirect_to sponsor, notice: tr('sponsorship_destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsorship
      @sponsorship = Sponsorship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsorship_params
      params.require(:sponsorship).permit(:school_year, :sponsor_id, :sponsor_code, :number_children, :dollar_amount)
    end

    def check_permission
      return if @user && @user.can_access_sponsor?
      return head :unauthorized
    end
end
