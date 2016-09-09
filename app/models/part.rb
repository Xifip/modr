class Part < ActiveRecord::Base

  has_many :bomitems
  belongs_to :partable, polymorphic: true
  belongs_to :manufacturer
  has_many :distrubitor_parts

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Component.create! row.to_hash
    end
  end
end
