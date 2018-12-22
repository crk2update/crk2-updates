class ClothesController < ApplicationController
  before_action :check_delete_permission, only: [:destroy]


  def index
    @clothes = Cloth.all.order("clothes.ctype","clothes.cgender","clothes.csize" )
  end

  def show
    @clothes = Cloth.all.order("clothes.ctype","clothes.cgender","clothes.csize" )
  end


  def new
    @clothes = Cloth.new
  end
  
def show
	@clothes = Cloth.where("id= ?", params[:id])
  end
  
  
  
  def create
    @clothes = Cloth.new(cloth_params)

    respond_to do |format|
      if @clothes.save
        format.html { redirect_to @clothes, notice: tr("size_saved") }
      else
        format.html { render :new }
      end
    end
  end
  
  def cloth_params
   params.require(:cloth).permit(:cgender, :ctype, :csize, :cdescription)
  end
end
