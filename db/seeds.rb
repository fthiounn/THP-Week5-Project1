# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'

nb_user = 50
nb_city = 20
nb_gossip = 100
nb_tags = 20
nb_messages = 400
nb_comments = 400
nb_likes = 300
users = []
cities = []
gossips = []
tags = []
messages = []
likes = []
comments = []
comments2 = []

#seeding des villes
nb_city.times do |x|
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code)
  cities << city
  puts "Seeding vity nb#{x}"
end


#Seeding des users
nb_user.times do |x|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(16..80),
    city_id: cities[rand(0..nb_city-1)].id)
  users << user
  puts "Seeding user nb#{x}"
end

# Seed des gossips
nb_gossip.times do |x|
  gossip = Gossip.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      user_id: users[rand(0..nb_user-1)].id)
  gossips << gossip
  puts "Seeding gossip nb#{x}"
end

#Seed des tags
nb_tags.times do |x|
  tag = Tag.create(
    title: Faker::Book.genre)
  tags << tag
  puts "Seeding tag nb#{x}"
end

#seed des gossip_tags (1 par gossip)
nb_gossip.times do |x|
  GossipTag.create(
      gossip_id: gossips[x],
      tag_id: tags[rand(0..nb_tags-1)].id)
  puts "Seeding a tag to the gossip nb#{x}"
end

#seed de tags supplementaires
10.times do |x|
  GossipTag.create(
      gossip_id: gossips[rand(0..nb_gossip-1)],
      tag_id: tags[rand(0..nb_tags-1)].id)
  puts "Seeding a tag to the gossip nb#{x}"
end

#seeding des messages
nb_messages.times do |x|
  message = PrivateMessage.create(
    sender_id: users[rand(0..nb_user-1)].id,
    content: Faker::Lorem.paragraph)
  messages << message
  puts "Seeding Private messages nb#{x}"
end
#adding at least 1 recipient per pm
nb_messages.times do |x|
  message = RecipientList.create(
    private_message_id: messages[x].id,
    recipient_id: users[rand(0..nb_user-1)].id)
  messages << message
  puts "Seeding Recipient to Private messages nb#{x}"
end
#seeding des recipients
nb_messages.times do |x|
  message = RecipientList.create(
    private_message_id: messages[rand(0..nb_messages-1)].id,
    recipient_id: users[rand(0..nb_user-1)].id)
  messages << message
  puts "Seeding Random Recipients Recipient to Private messages nb#{x}"
end
#seeding des comments
nb_comments.times do |x|
  comment = Comment.create(
      content: Faker::Lorem.paragraph,
      user_id: users[rand(0..nb_user-1)].id,
      gossip_id: gossips[rand(0..nb_gossip-1)].id)
  comments << comment
  puts "Seeding comments to gossips nb#{x}"
end

#seeding des likes vers comments
nb_likes.times do |x|
  like = Like.create(
    comment_id: comments[rand(0..nb_comments-1)].id)
  likes << like
  puts "Seeding Random Recipients Recipient to Private messages nb#{x}"
end
#seeding des likes vers gossip
nb_likes.times do |x|
  like = Like.create(
    gossip_id: gossips[rand(0..nb_gossip-1)].id)
  likes << like
  puts "Seeding Random Recipients Recipient to Private messages nb#{x}"
end
#seeding comments of comments
nb_comments.times do |x|
  comment = Comment.create(
      content: Faker::Lorem.paragraph,
      user_id: users[rand(0..nb_user-1)].id,
      comment_id: comments[rand(0..nb_comments-1)].id)
  comments2 << comment
  puts "Seeding comments to comments of gossips nb#{x}"
end















