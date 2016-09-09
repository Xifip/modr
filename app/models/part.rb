class Part < ActiveRecord::Base

  has_many :bomitems
  belongs_to :manufacturer

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Component.create! row.to_hash
    end
  end
end
