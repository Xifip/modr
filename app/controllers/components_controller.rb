class ComponentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @components = Component.order(:resmed_part)
      respond_to do |format|
      format.html
      format.csv { send_data @components.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def import
    Component.import(params[:file])
    redirect_to root_url, notice: "Components imported."
  end

end


