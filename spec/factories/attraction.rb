FactoryGirl.define do
  factory :attraction do
    sequence(:name) { |n| "Cool Place #{n}" }
    latitude 45.9
    longitude 45.5
    description "It's been there a while"
    association :creator, factory: :user
  end
end