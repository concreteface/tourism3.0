class AttractionSerializer < ActiveModel::Serializer
	
  attributes :name, :latitude, :longitude, :description, :photo
end
