require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe '#add_photo' do
    let(:attraction) { FactoryGirl.create(:attraction) }
    it 'takes a file location as an argument' do
      attraction.add_photo('test.jpg')
      expect(attraction.photo_url).to eq("/uploads/attraction/photo/#{attraction.id}/test.jpg")
    end

    it 'takes a remote file location as an argument' do
      attraction.add_remote_photo('https://s3.amazonaws.com/tourismdevelopment/test.jpg')
      expect(attraction.photo_url).to eq("/uploads/attraction/photo/#{attraction.id}/tmp_image.jpg")
    end

    describe '#get_latitude' do
      it 'extracts latitude from a photo' do
        expect(attraction.get_latitude('test.jpg')).to eq(35.102291083333334)
      end
    end

    describe '#get_longitude' do
      it 'extracts longitude from a photo' do
        expect(attraction.get_longitude('test.jpg')).to eq(138.86029052777778)
      end
    end

    describe '#set_geolocation' do
      it 'sets geolocation on photo upload' do
        attraction.add_photo('test.jpg')
        expect(attraction.latitude).to eq(35.102291083333334)
        expect(attraction.longitude).to eq(138.86029052777778)
      end
    end

    describe '#set_latitude' do
      it 'sets the latitude' do
        attraction.set_latitude(38.0)
        expect(attraction.latitude).to eq(38.0)
      end
    end
    describe '#set_longitude' do
      it 'sets the longitude' do
        attraction.set_longitude(160.0)
        expect(attraction.longitude).to eq(160.0)
      end
    end
  end
end
