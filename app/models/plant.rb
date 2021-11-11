class Plant < ApplicationRecord

  def self.create_from_collection(plants)
    plants.each do |plant_hash|
      Plant.find_or_create_by(name: plant_hash[:name]) do |plant|
        plant.alt_name = plant_hash[:alt_name]
        plant.origin = plant_hash[:origin]
        # .match(/[a-zA-Z&]/) mb dont need
      end
    end

  end

end
