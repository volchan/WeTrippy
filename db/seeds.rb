require 'yaml'

User.destroy_all
Country.destroy_all
Language.destroy_all

puts '> seeding countries'

I18nData.countries('FR').each do |country|
  country = Country.create!(
    slug: country[0],
    name: country[1]
  )
  puts "> seeded: #{country.id} - #{country.slug} - #{country.name}"
end
puts 'Done!'
puts '-' * 20

puts '> seeding languages'

I18nData.languages('FR').each do |language|
  language = Language.create!(
    slug: language[0],
    name: language[1]
  )
  puts "> seeded: #{language.id} - #{language.slug} - #{language.name}"
end
puts 'Done!'
puts '-' * 20

puts '> seeding admins'
users_file = Rails.root.join('db', 'seeds', 'users.yml')
users_yml = YAML.load_file(users_file)
users_yml.each do |user|
  User.new(user).save!(validate: false)
  user = User.last
  puts "> seeded: #{user.id} - #{user.first_name} #{user.last_name}"
end
puts 'Done!'
puts '-' * 20

puts '> seeding random users'
countries = Country.all
20.times do
  user_params = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Time.zone.at(0 + rand * (Time.zone.now.to_f - 0.to_f)).to_date,
    country: countries.sample,
    phone: Faker::PhoneNumber.cell_phone,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proiden.',
    address: "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}",
    sex: %w[0 1].sample.to_i,
    hobbies: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    privileges: 0,
    password: 'RubyRules33!'
  }
  user = User.new(user_params)
  username = "#{user.first_name}#{user.last_name}"
  user.email = Faker::Internet.free_email(username)
  user.save!
  puts "> seeded: #{user.id} - #{user.first_name} #{user.last_name} - #{user.address} - #{user.email}"
end
puts 'Done!'
puts '-' * 20

puts '> seeding categories'
categories_file = Rails.root.join('db', 'seeds', 'categories.yml')
categories_yml = YAML.load_file(categories_file)

categories_yml.each do |category|
  category = Category.create!(category)
  puts "> seeded: #{category.id} - #{category.name}"
end
puts 'Done!'
puts '-' * 20
