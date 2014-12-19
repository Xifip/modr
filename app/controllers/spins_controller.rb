class SpinsController < ApplicationController
  before_action :authenticate_user!
  
	def index
    @product = Product.find(params[:product_id])		
    @spins = @product.spins
	end

  def new
    @product = Product.find(params[:product_id])
    @spin = @product.spins.new
  end

  def create
    @product = Product.find(params[:product_id])
    #@spin = @product.spins.new(name: params[:spin][:name], description: params[:spin][:description])
    @spin = @product.spins.new(spin_params)
    if @spin.save
      flash[:notice] = "Successfully created spin."
      redirect_to(product_spin_items_path(@product, @spin), :notice => 'Spin was successfully created.')
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:id])
    @spin.update_attributes(spin_params)
    redirect_to(product_spins_path(@product), :notice => 'Spin was successfully updated.')
  end

  def destroy
    @product = Product.find(params[:product_id])
    @spin = Spin.find(params[:id])
    @spin.destroy
    redirect_to(product_spins_path(@product), :notice => 'Spin was successfully destroyed.')
  end

  private

  def spin_params
    params.require(:spin).permit(:name, :description, :item_count)
  end 
end
