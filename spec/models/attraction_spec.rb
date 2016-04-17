require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe '#add_photo' do
    let(:attraction) { FactoryGirl.create(:attraction) }
    it 'takes a file location as an argument' do
      attraction.add_photo('gnome.jpg')
      expect(attraction.photo_url).to eq("/uploads/attraction/photo/#{attraction.id}/gnome.jpg")
    end

    it 'extracts latitude from a photo' do
      expect(Attraction.get_latitude('test.jpg')).to eq(42.7634)
    end

    it 'extracts longitude from a photo' do
      expect(Attraction.get_longitude('test.jpg')).to eq(-71.21994722222222)
    end
  end
end
