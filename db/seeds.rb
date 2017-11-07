# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
caro = User.create!(email: 'caro@me.com', password: 'aucun0', name: 'caro')
dou = User.create!(email: 'dou@me.com', password: 'aucun0', name: 'dou')
zoe = User.create!(email: 'zoe@me.com', password: 'aucun0', name: 'zoi')

anniv =Product.create!(title: "Anniv", content: "18 ans" )
noel = Product.create!(user: caro, title: "Noel", description:"Noel 2017", place: "l'appart" )
matche = Product.create!(user: dou, title: "matche", description:"OL PSG", place: "Decines" )
rugby = Product.create!(user: dou, title: "rugby", description:"salon des loges", place: "gerland" )

#invites ?
anniv.invites.create! user: caro
noel.invites.create! user: caro
matche.invites.create! user: dou
rugby.invites.create! user: caro
