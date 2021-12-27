class ProductsController < ApplicationController
  
  def index
    if params[:format].present?
      # assign product to particular category by giving category_id in which you want to save and show the product
      @products = Product.where(category_id: params[:format] )
    else
      @products = Product.all
    end
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
    respond_to do |format| 
      format.html { redirect_to products_path }
      format.json { head :no_content }
      flash[:info] = "Product is succefully destroy."
    end
    
  end


  private

  def new_params_product
    params.require(:product).permit(:name, :description, :color, :price, :category_id, :quantity, images:[])
  end

  def edit_params_product
    params.require(:product).permit(:id, :name, :description, :color, :price, :category_id, :quantity, images:[])
  end

end