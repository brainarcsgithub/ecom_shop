class ProductsController < ApplicationController
  
  def index

    @products = Product.all
    
  end


  def new
    @product = Product.new
  end

  def create
    @product =Product.new(new_params_product)
    @product.save
    redirect_to products_path
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    @product.update(edit_params_product)
    redirect_to products_path
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private

  def new_params_product
    params.require(:product).permit(:name, :description, :color, :category_id, images:[])
  end

  def edit_params_product
    params.require(:product).permit(:id, :name, :description, :color, :category_id, images:[])
  end

end