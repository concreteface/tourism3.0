require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe '#add_photo' do
    let(:attraction) { FactoryGirl.create(:attraction) }
    it 'takes a file location as an argument' do
      attraction.add_photo('gnome.jpg')
      expect(attraction.photo_url).to eq("/uploads/attraction/photo/#{attraction.id}/gnome.jpg")
      expect(attraction.latitude).to eq(nil)
      expect(attraction.longitude).to eq(nil)
    end

    describe '#get_latitude' do
      it 'extracts latitude from a photo' do
        expect(attraction.get_latitude('test.jpg')).to eq(42.7634)
      end
    end

    describe '#get_longitude' do
      it 'extracts longitude from a photo' do
        expect(attraction.get_longitude('test.jpg')).to eq(-71.21994722222222)
      end
    end

    describe '#set_geolocation' do
      it 'sets geolocation on photo upload' do
        attraction.add_photo('test.jpg')
        expect(attraction.latitude).to eq(42.7634)
        expect(attraction.longitude).to eq(-71.21994722222222)
      end
    end
  end
end
