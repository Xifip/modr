class Product < ActiveRecord::Base

  has_many :spins, dependent: :destroy

  validates_uniqueness_of :name, :product_number
end
