class ItemsController < ApplicationController
  before_action :authenticate_user!

	def index
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:spin_id])
    @items = @spin.items
	end

  def new
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:spin_id])
    @item = @spin.items.new
    if params[:has_label] == "false"
      if @item.save
        flash[:notice] = "Successfully created item."
        redirect_message = 'Item was successfully created.'
      else
        flash[:notice] = "Could not created item."
        redirect_message = 'Item was not successfully created.'
      end
      redirect_to(product_spin_items_path(@product, @spin), :notice => redirect_message)
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:spin_id])
    @item = @spin.items.new(item_params)
    if !@item.name.blank? && @item.save
      flash[:notice] = "Successfully created item."
      redirect_message = 'Item was successfully created.'
    else
      flash[:notice] = "Could not created item."
      redirect_message = 'Item was not successfully created.'
    end
    redirect_to(product_spin_items_path(@product, @spin), :notice => redirect_message)
  end

  def item_params
    params.require(:item).permit(:name, :spin_id, :barcodeimage)
  end


end
