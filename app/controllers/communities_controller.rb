class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy, :next_code]
  before_action :check_delete_permission, only: [:destroy]

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.all.order(code: :asc)
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @families = Family.joins(:community).where("communities.code = ?", @community.code).order("families.name ASC")
    @children = Child.joins(family: [:community]).where("communities.code = ?", @community.code).order("families.name ASC")
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # GET /communities/1/next_code
  def next_code
    max_code = Child.where("derived_community = ?", @community.code).order("derived_number DESC").first.try(:derived_number)||0
    @next_code = "#{max_code+1}"
	@next_code
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: tr('community_created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: tr('community_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: tr('community_deleted') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:code, :name)
    end
end
