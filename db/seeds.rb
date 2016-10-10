# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jason = User.create(username: "Jason")
joe = User.create(username: "Joe")

jason.tweets.create(content: "First seed tweet from Jason")
jason.tweets.create(content: "second tweet from Jason")
joe.tweets.create(content: "joes first tweet")
