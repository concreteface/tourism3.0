class Comment < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  validates :attraction, presence: true
  validates :user, presence: true
  validates :body, presence: true
end
