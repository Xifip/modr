class Component < ActiveRecord::Base

  has_many :bomcomponents

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Component.create! row.to_hash
    end
  end

end
