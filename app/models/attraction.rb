class Attraction < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  validates :name, presence: true, uniqueness: true
  # validates :photo, presence: true

  def add_photo(file_location)
    File.open(file_location) do |file|
      self.photo = file
    end
    save!
  end
end
