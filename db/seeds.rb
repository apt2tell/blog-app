require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_one = User.create(name: Faker::Name.name, photo: Faker::Avatar.image(size: "300x300", format: "jpg", set: "set1", bgset: "bg1"), bio: Faker::Lorem.paragraph(sentence_count: 6))

user_two = User.create(name: Faker::Name.name, photo: Faker::Avatar.image(size: "300x300", format: "jpg", set: "set1", bgset: "bg1"), bio: Faker::Lorem.paragraph(sentence_count: 6))

user_three = User.create(name: Faker::Name.name, photo: Faker::Avatar.image(size: "300x300", format: "jpg", set: "set1", bgset: "bg1"), bio: Faker::Lorem.paragraph(sentence_count: 6))

user_four = User.create(name: Faker::Name.name, photo: Faker::Avatar.image(size: "300x300", format: "jpg", set: "set1", bgset: "bg1"), bio: Faker::Lorem.paragraph(sentence_count: 6))

user_five = User.create(name: Faker::Name.name, photo: Faker::Avatar.image(size: "300x300", format: "jpg", set: "set1", bgset: "bg1"), bio: Faker::Lorem.paragraph(sentence_count: 6))

post_one = Post.create(author: user_one, title: Faker::Lorem.paragraph(sentence_count: 1), text: Faker::Lorem.paragraph(sentence_count: 40))

post_two = Post.create(author: user_two, title: Faker::Lorem.paragraph(sentence_count: 1), text: Faker::Lorem.paragraph(sentence_count: 40))

post_three = Post.create(author: user_three, title: Faker::Lorem.paragraph(sentence_count: 1), text: Faker::Lorem.paragraph(sentence_count: 40))

post_four = Post.create(author: user_four, title: Faker::Lorem.paragraph(sentence_count: 1), text: Faker::Lorem.paragraph(sentence_count: 40))

post_five = Post.create(author: user_five, title: Faker::Lorem.paragraph(sentence_count: 1), text: Faker::Lorem.paragraph(sentence_count: 40))

comment_one = Comment.create(author: user_two, post: post_one, text: Faker::Lorem.paragraph(sentence_count: 40))

comment_two = Comment.create(author: user_one, post: post_two, text: Faker::Lorem.paragraph(sentence_count: 40))

comment_three = Comment.create(author: user_four, post: post_three, text: Faker::Lorem.paragraph(sentence_count: 40))

comment_four = Comment.create(author: user_three, post: post_four, text: Faker::Lorem.paragraph(sentence_count: 40))