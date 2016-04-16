FactoryGirl.define do
  factory :comment do
    association :attraction, factory: :attraction
    association :user, factory: :user
    sequence(:body) {|n| "I've been there negative #{n} times"}
  end
end
