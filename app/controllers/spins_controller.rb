class SpinsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])		
    @spins = @product.spins
	end

  def edit

  end

  def destroy

  end
end
