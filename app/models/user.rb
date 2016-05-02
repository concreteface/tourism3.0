class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :created_attractions, class_name: 'Attraction', foreign_key: :creator_id
  has_many :visited_attractions, class_name: 'Attraction', through: :visits
  has_many :visits
  has_many :comments
  acts_as_commontator

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def add_avatar(file_location)
    File.open(file_location) do |file|
      self.avatar = file
    end
    save!
  end

  def add_remote_avatar(url)
    open('tmp_image.jpg', 'wb') do |file|
      file << open(url).read
    end
    self.add_avatar("#{Rails.root}/tmp_image.jpg")
  end

end
