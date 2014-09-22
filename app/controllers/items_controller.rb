class ItemsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])	
    @spin = Spin.find(params[:spin_id])		
    @items = @spin.items
	end

end
