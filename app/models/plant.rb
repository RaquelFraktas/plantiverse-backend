class Plant < ApplicationRecord

  def self.create_from_collection(plants)
    plants.each do |plant_hash|
      Plant.find_or_create_by(name: plant_hash[:name]) do |plant|
        plant.alt_name = plant_hash[:alt_name]
        plant.origin = plant_hash[:origin]
        plant.img_url = plant_hash[:img_url]
        # why do the ID numbers in the JSON page skip around?
      end
    end

  end

end
