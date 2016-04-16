class User < ActiveRecord::Base
  has_many :created_attractions, class_name: 'Attraction', foreign_key: :creator_id
  has_many :visited_attractions, class_name: 'Attraction', through: :visits
  has_many :visits
  has_many :comments

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
