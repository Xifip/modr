class Spin < ActiveRecord::Base

  belongs_to :product
  has_many :items, dependent: :destroy
  #has_many :buildstandards, dependent: :destroy

  #accepts_nested_attributes_for :buildstandards

  after_create :create_items

  def create_items
    unless self.item_count.blank?
      self.item_count.times do
        self.items.create
      end
    end
    self.update_attributes(item_count: 0)
  end

  def input_buildstandard
    first_item = self.items.first
    first_mod = first_item.mods.find(1)
    input_buildstandard = first_mod.buildstandard
    input_buildstandard
  end
end
