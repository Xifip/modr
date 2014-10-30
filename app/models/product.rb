class Product < ActiveRecord::Base

  has_many :spins, dependent: :destroy

  validates_uniqueness_of :name, :product_number
  validates_presence_of :name
  
  validates :product_number, :numericality => { :less_than_or_equal_to => 100 }, :presence => true
  def latest_spin_name
    name_last_spin = self.spins.order("created_at").last.name
    name_last_spin 
  end

end
