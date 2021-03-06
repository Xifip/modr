class ProductsController < ApplicationController
  before_action :authenticate_user!
  
	def index
		@products = Product.all
	end

  def edit
    @product = Product.find(params[:id])
  end

  def update   
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to(products_path, :notice => 'Product was successfully updated.')
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product was successfully destroyed."
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Successfully created product."
      #redirect_to @product.spins
      redirect_to(product_spins_path(@product), :notice => 'Product was successfully created.')
    else
      render :action => 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :product_number)
  end 
end
