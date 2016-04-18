require 'exifr'

class Attraction < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :visitors, class_name: 'User', through: :visits
  has_many :visits
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  before_save :extract_geolocation

  def add_photo(file_location)
    File.open(file_location) do |file|
      self.photo = file
    end
    save!
  end

  def extract_geolocation
    img = photo_url
    self.latitude = get_latitude(img)
    self.longitude = get_longitude(img)
  end

  def get_latitude(file_name)
    EXIFR::JPEG.new(file_name).gps.latitude rescue nil
  end

  def get_longitude(file_name)
    EXIFR::JPEG.new(file_name).gps.longitude rescue nil
  end
end
