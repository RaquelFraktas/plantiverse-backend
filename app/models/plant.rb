class Plant < ApplicationRecord

  def self.create_from_collection(plants)
    plants.each do |plant_hash|
      Plant.create(plant_hash)
    end
  end

end
