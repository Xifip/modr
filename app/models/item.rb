require 'barby'
require 'barby/barcode/code_128'
#require 'barby/outputter/ascii_outputter'
#require 'barby/outputter/html_outputter'
require 'chunky_png'
require 'barby/outputter/png_outputter'
#require 'rmagick'
#require 'barby/outputter/rmagick_outputter'

class Item < ActiveRecord::Base

  belongs_to :spin
  has_many :mods, dependent: :destroy

  after_create :item_name
  mount_uploader :barcodeimage, BarcodeimageUploader

  validates_uniqueness_of :name
  validates_length_of :name, :is => 10, :allow_blank => true

  def get_mod_name
    mod_count = self.mods.count
    mod_num = "mod" + mod_count.to_s
    mod_name = self.spin.product.name + "_" + self.spin.name + "_" + self.name + "_" + mod_num
    mod_name
  end


  def get_next_serial_num
    id_s = self.id.to_s
    id_s[0] = '' if self.id > 999
    id_i = id_s.to_i

    zeros = 4 - id_i.to_s.length
    zerochars = ""    
    zeros.times do
      zerochars = zerochars + "0"
    end
    serial_num = zerochars + id_i.to_s
    serial_num
  end

  def item_name
    # add barcode to s3
    if self.name.blank?
      week_of_year = Time.now.strftime("%U")    
      current_year = Time.now.strftime("%y")
      productnumber = self.spin.product.product_number
      serial_num = self.get_next_serial_num
      item_name = current_year.to_s + week_of_year.to_s + productnumber.to_s + serial_num.to_s
    else
      item_name = self.name
    end
    s3 = AWS::S3.new    
    
    path =  'uploads/' + item_name + '/' + item_name + '.png'


    @code = item_name.to_s
    @barcode = Barby::Code128B.new(@code)    
    blob = Barby::PngOutputter.new(@barcode).to_png #Raw PNG data
    
    s3.buckets['modr'].objects[path].write(blob, :acl => :public_read)   

    #update item name    
    objUri = s3.buckets['modr'].objects[path].public_url.to_s
    self.update_attributes(name: item_name, image_url: objUri)
    
    #create initial mod
    mod_name = self.get_mod_name
    self.mods.create(name: mod_name, description: "initial mod")
  end

end
