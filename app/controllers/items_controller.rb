class ItemsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])	
    @spin = Spin.find(params[:spin_id])		
    @items = @spin.items
	end

  def new
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = @spin.items.new
    if @item.save
      flash[:notice] = "Successfully created item."
      redirect_to(product_spin_items_path(@product, @spin), :notice => 'Item was successfully created.')
    else
      flash[:notice] = "Could not created item."
      redirect_to(product_spin_items_path(@product, @spin), :notice => 'Item was not successfully created.')
    end
  end

  def item_params
    params.require(:item).permit(:name, :spin_id, :barcodeimage)
  end 


end
