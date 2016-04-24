require 'exifr'
require 'open-uri'

class Attraction < ActiveRecord::Base
  attr_accessor :address
  mount_uploader :photo, PhotoUploader
  reverse_geocoded_by :latitude, :longitude
  before_validation :reverse_geocode
  acts_as_commontable

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :visitors, class_name: 'User', through: :visits
  has_many :visits
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :latitude, numericality: true, allow_blank: true
  validates :longitude, numericality: true, allow_blank: true
  before_create :extract_geolocation

  def add_photo(file_location)
    File.open(file_location) do |file|
      self.photo = file
    end
    save!
  end

  def add_remote_photo(url)
    open('tmp_image.jpg', 'wb') do |file|
      file << open(url).read
    end
    self.add_photo("#{Rails.root}/tmp_image.jpg")
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

  def set_latitude(lat)
    self.latitude = lat
    save!
  end


  def set_longitude(long)
    self.longitude = long
    save!
  end

end
