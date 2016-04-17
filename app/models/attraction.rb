require 'exifr'

class Attraction < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :visitors, class_name: 'User', through: :visits
  has_many :visits
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true

  def add_photo(file_location)
    File.open(file_location) do |file|
      self.photo = file
    end
    save!
  end

  def self.get_latitude(file_name)
    EXIFR::JPEG.new(file_name).gps.latitude
  end

  def self.get_longitude(file_name)
    EXIFR::JPEG.new(file_name).gps.longitude
  end
end
