class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category =Category.new(new_params_category)
    @category.save
    redirect_to categories_path
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category.update(edit_params_category)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect_to categories_path
  end


  private

  def new_params_category
    params.require(:category).permit(:name, :cat_type, :avatar)
  end

  def edit_params_category
    params.require(:category).permit(:id, :name, :cat_type, :avatar)
  end
end