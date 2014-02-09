# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Quest.delete_all
Reward.delete_all

Quest.create({
  :title  => 'Küche aufgeräumt',
  :points => 50,
  :image_url => 'glyphicon-fire'
})


Quest.create({
  :title  => 'Müll rausgebracht',
  :points => 1,
  :image_url => 'glyphicon-trash'
})


Quest.create({
  :title  => 'Getränke gekauft',
  :points => 5,
  :image_url => 'glyphicon-glass'
})

Reward.create({
  :title => 'Roter Artikel einlösen (Getränk)',
  :points => 15,
  :image_url => 'icon-beer'
})

Reward.create({
  :title => 'Gelber Artikel einlösen (Snack)',
  :points => 10,
  :image_url => 'icon-drink'
})

Reward.create({
  :title => 'Blauer Artikel einlösen (Mini-Snack)',
  :points => 5
})



require 'ffaker'

hacker = Hacker.first

1.upto(10) do
  Earning.create({
    :hacker => hacker,
    :user   => (rand(100) % 2) == 0 ? hacker : nil,
    :points => rand(100),
    :quest  => Quest.all.shuffle.first,
    :chronicle_text => Faker::Lorem.sentence
  })
end

1.upto(4) do
  Redemption.create({
    :hacker => hacker,
    :user   => (rand(100) % 2) == 0 ? hacker : nil,
    :points => rand(100),
    :reward  => Reward.all.shuffle.first,
    :chronicle_text => Faker::Lorem.sentence
  })
end

Cancel.create({
  :hacker => hacker,
  :subject => Earning.all.shuffle.first,
  :chronicle_text => Faker::Lorem.sentence
})



Cancel.create({
  :hacker => hacker,
  :subject => Redemption.all.shuffle.first,
  :chronicle_text => Faker::Lorem.sentence
})





