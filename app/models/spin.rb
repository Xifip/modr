class Spin < ActiveRecord::Base

  belongs_to :product
  has_many :items, dependent: :destroy
  has_many :buildstandards, dependent: :destroy

  accepts_nested_attributes_for :buildstandards

  validates_uniqueness_of :name

  after_create :create_items

  def create_items
    unless self.item_count.blank?
      self.item_count.times do
        self.items.create
      end
    end
    self.update_attributes(item_count: 0)
  end
end
