class Spin < ActiveRecord::Base

  belongs_to :product
  has_many :items, dependent: :destroy
  has_many :buildstandards, dependent: :destroy

  accepts_nested_attributes_for :buildstandards





end
