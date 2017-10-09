# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cosmetics = Category.create!(name: 'Cosmetics')
skincare = Category.create!(name: 'Skincare')
household_cleaning = Category.create!(name: 'Household/Cleaning')
fragrance = Category.create!(name: 'Fragrance')
body_care = Category.create!(name: 'Body Care')
hair_care = Category.create!(name: 'Hair Care')
personal_care = Category.create!(name: 'Personal Care')
animal_care = Category.create!(name: 'Animal Care')

puts "#{Category.count} categories created!"

Post.create!(name: 'Maybelline', category_id: cosmetics.id, is_cruelty_free: false, link: 'https://www.maybelline.com/faq')
Post.create!(name: 'Tom\'s of Maine', category_id: personal_care.id, is_cruelty_free: true, link: 'http://www.tomsofmaine.com/home')
Post.create!(name: 'Colourpop Cosmetics', category_id: cosmetics.id, is_cruelty_free: true, link: 'https://colourpop.com/')
Post.create!(name: 'Tide', category_id: household_cleaning.id, is_cruelty_free: false, link: 'https://tide.com/en-us/contact-us')
Post.create!(name: 'Bath & Body Works', category_id: body_care.id, is_cruelty_free: true, link: 'http://www.bathandbodyworks.com/')
Post.create!(name: 'Bath & Body Works', category_id: fragrance.id, is_cruelty_free: true, link: 'http://www.bathandbodyworks.com/')

puts "#{Post.count} posts created!"
