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
  end

  def create
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = @spin.items.new(item_params)
    if @item.name.blank?
      flash[:notice] = "Could not created item."
      redirect_to(product_spin_items_path(@product, @spin), :notice => 'Item was not successfully created.')
    elsif @item.save
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
