class Official::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_category, only: [:show, :edit, :update]
  layout "official/application"

  def show    
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Successful create"
      redirect_to [:official, @category]
    else
      flash.now[:danger] = "Fail create"
      render "new"
    end
  end

  def edit    
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Successful update"
      redirect_to [:official, @category]
    else
      flash.now[:danger] = "Fail create"
      render "edit"
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = "Successful delete"
    redirect_to official_categories_path
  end

  private
  def load_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit :id, :name
  end
end
