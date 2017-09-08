FactoryGirl.define do
  factory :comment do
    user
    experience
    rating 1
    comment 'a' * 250
  end
end
