class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

  def show
    @current_product = Product.find(params[:id])
    @spins = @current_product.spins
  end

end
