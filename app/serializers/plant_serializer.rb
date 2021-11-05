class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :alt_name, :img_url, :description, :origin
end
