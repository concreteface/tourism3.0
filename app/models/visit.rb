class Visit < ActiveRecord::Base
  belongs_to :visitor, class_name: 'User', foreign_key: :user_id
  belongs_to :visited_attractions, class_name: 'Attraction', foreign_key: :attraction_id

  validates :user, presence: true
  validates :attraction, presence: true
end
