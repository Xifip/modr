class ItemsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])	
    @spin = Spin.find(params[:spin_id])		
    @items = @spin.items
    
    #@barcodes_array = []
    #@items.each do |item|
    #  barcode = item.gen_barcode
    #  @barcodes_array.push(barcode)
    #end    
	end
=begin
  def new
    @item = Item.new(:spin_id => params[:spin_id])
    @spin = @item.spin
    @product = @spin.product
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Successfully created item."
      redirect_to @item.spin
    else
      render :action => 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :spin_id, :barcodeimage)
  end 
=end
end