require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#add_avatar' do
    let(:user) { FactoryGirl.create(:user) }
    it 'takes a file location as an argument' do
      user.add_avatar('test.jpg')
      expect(user.avatar_url).to eq("/uploads/user/avatar/#{user.id}/test.jpg")
    end

    it 'takes a remote file location as an argument' do
      user.add_remote_avatar('https://s3.amazonaws.com/tourismdevelopment/test.jpg')
      expect(user.avatar_url).to eq("/uploads/user/avatar/#{user.id}/tmp_image.jpg")
    end
  end
end
