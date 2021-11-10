class Plant < ApplicationRecord

  def self.create_from_collection(plants)
    plants.each do |plant_hash|
      Plant.create(plant_hash)
      #do find or create_by_name bc there are dupes in there
    end
  end

end
