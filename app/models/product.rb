class Product < ActiveRecord::Base

  has_many :spins, dependent: :destroy

  validates_uniqueness_of :name, :product_number

  def latest_spin_name
    name_last_spin = self.spins.order("created_at").last.name
    name_last_spin 
  end

end
