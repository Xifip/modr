class Spin < ActiveRecord::Base

  belongs_to :product
  has_many :items, dependent: :destroy
  has_many :buildstandards, dependent: :destroy

  after_create :initial_bom_buildstandard
  after_create :create_items

  validates_presence_of :product_id

  def create_items
    unless self.item_count.blank?
      self.item_count.times do
        self.items.create
      end
    end
    self.update_attributes(item_count: 0)
  end

  def initial_bom_buildstandard
    #create initial bom and _buildstandard
    product = self.product
    schematic_name_01 = product.name + "_SCH_01"
    bom_description = (product.description + '_' + self.description + "_bom_1").tr(' ', '_')
    bom = Bom.create(description: bom_description )

    bom.buildstandards.create( schematic: schematic_name_01,
                               description: "initial BS",
                               spin_id: self.id )
  end

  def input_buildstandard
    first_item = self.items.first
    first_mod = first_item.mods.find(1)
    input_buildstandard = first_mod.buildstandard
    input_buildstandard
  end

end
