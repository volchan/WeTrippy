FactoryGirl.define do
  factory :user, aliases: %I[host] do
    Faker::Config.locale = 'fr'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    birth_date Date.today
    country
    phone Faker::PhoneNumber.cell_phone
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proiden.'
    address '107 cours balguerie stuttenberg 33300 bordeaux'
    sex 1
    hobbies 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    privileges 1
    sequence(:email) { |_| Faker::Internet.free_email }
    password 'RubyRules33!'
  end
end
