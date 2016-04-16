class Visit < ActiveRecord::Base
  belongs_to :visitor, class_name: 'User', foreign_key: :user_id
  belongs_to :visited_attraction, class_name: 'Attraction', foreign_key: :attraction_id

  validates :visitor, presence: true
  validates :visited_attraction, presence: true
  validates :user_id, uniqueness: {scope: :attraction_id}
end
