class ModsController < ApplicationController

	def index
    @product = Product.find(params[:product_id])	
    @spin = Spin.find(params[:spin_id])		
    @item = Item.find(params[:item_id])	
    @mods = @item.mods
	end

  def new
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = Item.find(params[:item_id])
    @mod = @item.mods.new
  end

  def create
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = Item.find(params[:item_id])
    @next_mod_name = @item.get_mod_name
    @mod = @item.mods.new(mod_params)
    if @mod.save
      @mod.update_attributes(name: @next_mod_name)
      flash[:notice] = "Successfully created mod."
      redirect_to(product_spin_item_mods_path(@product, @spin, @item), :notice => 'Mod was successfully created.')
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = Item.find(params[:item_id])
    @mod = Mod.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])    
    @spin = Spin.find(params[:spin_id])
    @item = Item.find(params[:item_id])
    @mod = Mod.find(params[:id])
    @mod.update_attributes(mod_params)
    redirect_to(product_spin_item_mods_path(@product, @spin, @item), :notice => 'Mod was successfully undated.')
  end

  private

  def mod_params
    params.require(:mod).permit(:name, :description)
  end 
end
