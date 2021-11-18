class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :alt_name, :img_url, :description, :origin
  has_many :user_plants
  has_many :users, :through => :user_plants
end
