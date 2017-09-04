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

puts '> seeding admin users'
users_yml = YAML.load(ERB.new(File.read("db/seeds/users.yml")).result)
users_yml.each do |user|
  user = User.new(user)
  user.save!
  user.send(:avatar_url=, Faker::Avatar.image, folder: "WeTrippy/Users/#{user.id}")
  puts "> seeded: #{user.id} - #{user.privileges} - #{user.first_name} #{user.last_name} - #{user.address} - #{user.email}"
end
puts 'Done!'
puts '-' * 20

puts '> seeding randmon users'
20.times do
  random_user_call = RestClient.get('https://randomuser.me/api/?nat=fr')
  parsed_random_user_call = JSON.parse(random_user_call, object_class: OpenStruct)
  user_data = parsed_random_user_call.results.first
  new_user  = User.create!(
    first_name: user_data.name.first,
    last_name: user_data.name.last,
    email: user_data.email,
    birth_date: user_data.dob,
    country_id: (1..249).to_a.sample,
    phone: user_data.cell,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proiden.',
    address: "#{user_data.location.street} #{user_data.location.postcode} #{user_data.location.city}",
    sex: %w[0 1].sample.to_i,
    hobbies: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    privileges: 0,
    password: 'RubyRules33!'
  )
  new_user.send(:avatar_url=, user_data.picture.medium, folder: "WeTrippy/Users/#{new_user.id}")
  puts "> seeded: #{new_user.id} - #{new_user.privileges} - #{new_user.first_name} #{new_user.last_name} - #{new_user.address} - #{new_user.email}"
end
puts 'Done!'
puts '-' * 20

puts '> adding user languages'
languages = Language.all
User.all.each do |user|
  UserLanguage.create!(user: user, language: languages.sample)
  puts "> seeded: #{user.id} - #{user.first_name} #{user.last_name} - #{user.user_languages.first.language.slug} - #{user.user_languages.first.language.name}"
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

puts '> seeding experiences'
experiences_yml = YAML.load(ERB.new(File.read("db/seeds/experiences.yml")).result)
experiences_covers = YAML.load(File.read("db/seeds/exp_covers.yml"))
counter = 0
experiences_yml.each do |experience|
  new_experience = Experience.create!(experience)
  new_experience.send(:cover_url=, experiences_covers[counter], folder: "WeTrippy/Experiences/Cover/#{new_experience.id}/")

  unsplash_photos = %w(https://unsplash.it/800/600 https://unsplash.it/800/600 https://unsplash.it/800/600 https://unsplash.it/800/600)
  new_experience.send(:photo_urls=, unsplash_photos, folder: "WeTrippy/Experiences/desc_photos/#{new_experience.id}/")
  puts "> seeded: #{new_experience.id} - #{new_experience.title} - #{new_experience.category.name} - #{new_experience.slots}"

  puts '>> seeding exp_language'
  rand(1..2).times do
    exp_language = ExpLanguage.create!(experience: new_experience, language_id: rand(1..185))
    puts ">> seeded: #{exp_language.language.slug} - #{exp_language.language.name}"
  end
  puts '>> Done!'
  puts '-' * 20

  puts '>> seeding steps'
  addresses = YAML.load(ERB.new(File.read("db/seeds/addresses.yml")).result)
  rand(1..5).times do |n|
    case n
    when 0
      start_at = Time.zone.now + rand(1..5).days
      end_at = start_at + rand(1..5).hours
    when 1
      start_at = Time.zone.now + rand(6..10).days
      end_at = start_at + rand(1..5).hours
    when 2
      start_at = Time.zone.now + rand(11..15).days
      end_at = start_at + rand(1..5).hours
    when 3
      start_at = Time.zone.now + rand(16..20).days
      end_at = start_at + rand(1..5).hours
    when 4
      start_at = Time.zone.now + rand(21..25).days
      end_at = start_at + rand(1..5).hours
    when 5
      start_at = Time.zone.now + rand(26..30).days
      end_at = start_at + rand(1..5).hours
    end
    new_step = Step.create!(
      experience: new_experience,
      start_at: start_at,
      end_at: end_at,
      address: addresses.sample,
    )
    puts ">> seeded: #{new_step.id} - #{new_step.start_at} - #{new_step.end_at} - #{new_step.address}"
  end
  puts '>> Done!'
  puts '-' * 20
  counter += 1
end
puts 'Done!'
puts '-' * 20
