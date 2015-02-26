class BuildstandsController < ApplicationController
  before_action :authenticate_user!
  
	def show
    @mod = Mod.find(params[:mod_id])	
    @buildstandard = Buildstandard.find(params[:id])
    @bom = @buildstandard.bom		
    @bom_comonents = @bom.bomcomponents
	end
end
