class Official::ProductTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_productype, only: [:show, :edit, :update]
  layout "official/application"

  def show
    
  end

  def index
    @product_types = ProductType.all
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new product_type_params
    if @product_type.save
      flash[:success] = "Successful create"
      redirect_to [:official, @product_type]
    else
      flash.now[:danger] = "Fail create"
      render "new"
    end
  end

  def edit    
  end

  def update
    if @product_type.update_attributes product_type_params
      flash[:success] = "Successful update"
      redirect_to [:official, @product_type]
    else
      flash.now[:danger] = "Fail update"
      render "edit"
    end
  end

  def destroy
    ProductType.find(params[:id]).destroy
    flash[:success] = "Successful delete"
    redirect_to official_product_types_path
  end

  private
  def product_type_params
    params.require(:product_type).permit :id, :name,
                  fields_attributes: [:id, :name, :field_type, :required, :_destroy]
  end

  def load_productype
    @product_type = ProductType.find params[:id]
  end
end
