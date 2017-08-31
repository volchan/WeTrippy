FactoryGirl.define do
  factory :step do
    country
    experience
    start_at Time.zone.now + (1..5).to_a.sample.minutes
    end_at Time.zone.now + (6..10).to_a.sample.minutes
    address "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}"
  end
end
