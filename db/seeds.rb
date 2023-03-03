# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
user = User.create(name: "Luke", email: "Luke@gmail.com", password: "123456")
costume = Costume.new(price: 100, title: "Clown", description: "Laughing in color", user: user)
costume.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
costume.save
# https://res.cloudinary.com/dvjbqqvo9/image/upload/v1677783188/ben-wicks-Ns96HhR-b-c-unsplash_gejptx.jpg
