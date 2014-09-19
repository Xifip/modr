class Product < ActiveRecord::Base

  has_many :spins, dependent: :destroy

end
