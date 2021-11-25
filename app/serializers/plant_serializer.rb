class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :altName, :imgUrl, :description, :origin
  # has_many :user_plants
  # has_many :users, :through => :user_plants

  def imgUrl
    self.object.img_url
  end

  def altName
    self.object.alt_name
  end
#since the Pagy overrides the key transforms, I had to manually 
#redefine my JSON key names.
#from the developer - your key transforms are probably applied before you add the pagy_metadata or just skipping it. 
# You should apply the transforms on the result of pagy_metadata before adding it to your response.


end
