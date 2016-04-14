require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe '#add_photo' do
    let(:attraction) { FactoryGirl.create(:attraction) }
    it 'takes a file location as an argument' do
      attraction.add_photo('gnome.jpg')
      expect(attraction.photo_url).to eq("/uploads/attraction/photo/#{attraction.id}/gnome.jpg")
    end
  end
end
