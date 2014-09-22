class Item < ActiveRecord::Base

  belongs_to :spin
  has_many :mods, dependent: :destroy

  after_create :item_name
  
  def get_mod_name
    mod_count = self.mods.count
    mod_name = "mod" + mod_count.to_s
  end


  def get_next_serial_num
    zeros = 4 - self.id.to_s.length
    zerochars = ""    
    zeros.times do
      zerochars = zerochars + "0"
    end
    serial_num = zerochars + self.id.to_s
    serial_num
  end

  def item_name
    week_of_year = Time.now.strftime("%U")    
    current_year = Time.now.strftime("%y")
    productnumber = self.spin.product.product_number
    serial_num = self.get_next_serial_num
    item_name = current_year.to_s + week_of_year.to_s + productnumber.to_s + serial_num.to_s
    self.update_attributes(name: item_name)
  end

end
