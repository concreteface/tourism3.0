FactoryGirl.define do
  factory :visit do
    association :visitor, factory: :user
    association :visited_attraction, factory: :attraction
  end
end
