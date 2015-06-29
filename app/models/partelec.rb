class Partelec < ActiveRecord::Base

  has_many :parts, as: :partable
end
