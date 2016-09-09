require 'rubygems'
require 'json'
require 'net/http'

class PartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @parts = Part.all #order(:resmed_part)
      respond_to do |format|
      format.html
      format.csv { send_data @parts.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end

    unless @parts.blank?
      @part = @parts.first
      url = 'http://octopart.com/api/v3/parts/match?'
      url += '&queries=' + URI.encode(JSON.generate([{:mpn => @component.manufacturer_part}]))
      url += '&apikey=126fb77e'

      resp = Net::HTTP.get_response(URI.parse(url))
      server_response = JSON.parse(resp.body)

      @part_desc = []
      server_response['results'].each do |result|
        result['items'].each do |part|
          @part_desc.push((part['offers'].map{|offer| {sku: offer['sku'], seller: offer['seller']['name'], stock: offer['in_stock_quantity']} }))
        end
      end
      @part.update_attributes(description: @part_desc.to_s)
    end
    @parts
  end

  def import
    Component.import(params[:file])
    redirect_to root_url, notice: "Components imported."
  end

end
