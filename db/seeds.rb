# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Question.create!(title: "Where is the Seaweed?", body: "explain", user_id: 1)
    Question.create!(title: "How much Seaweed?", body: "for a farm..", user_id: 1)
