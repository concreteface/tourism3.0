FactoryGirl.define do
  factory :attraction do
    sequence(:name) { |n| "Cool Place #{n}" }
    description "It's been there a while"
    association :creator, factory: :user
    before(:create){|attraction| attraction.add_photo('test.jpg')}
  end
end
