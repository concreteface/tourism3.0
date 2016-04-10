class User < ActiveRecord::Base
  has_many :attractions, foreign_key: :creator_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
