class User < ActiveRecord::Base
  has_many :created_attractions, class_name: 'Attraction', foreign_key: :creator_id

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
