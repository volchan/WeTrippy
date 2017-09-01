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

puts '> seeding users'
users_yml = YAML.load(ERB.new(File.read("db/seeds/users.yml")).result)
users_yml.each do |user|
  user = User.new(user)
  if user.email.blank?
    username = "#{user.first_name}#{user.last_name}"
    user.email = Faker::Internet.free_email(username)
  end
  user.save!
  user.send(:avatar_url=, Faker::Avatar.image, use_filename: true, folder: "WeTrippy/Users/#{user.id}/")
  puts "> seeded: #{user.id} - #{user.privileges} - #{user.first_name} #{user.last_name} - #{user.address} - #{user.email}"
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
  new_experience.send(:cover_url=, experiences_covers[counter], use_filename: true, folder: "WeTrippy/Experiences/Cover/#{new_experience.id}/")
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
