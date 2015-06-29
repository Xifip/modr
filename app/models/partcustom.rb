class Partcustom < ActiveRecord::Base
  has_many :parts, as: :partable
end
