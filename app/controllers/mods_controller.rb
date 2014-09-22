class ModsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])	
    @spin = Spin.find(params[:spin_id])		
    @item = Item.find(params[:item_id])	
    @mods = @item.mods
	end

  def show

  end
end
