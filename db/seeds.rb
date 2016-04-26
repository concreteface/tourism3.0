# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user1 = User.create(username: 'jodama', email: 'john.jdm@gmail.com', admin: true, password: 'password')
@user2 = User.create(username: 'rick', email: 'rick@grimes.com', password: 'password')

@attraction1 = Attraction.new(name: 'Dog Fountain', description: 'I found it in downtown Numazu. Dogs never drink out of it. Only humans.', creator: @user2)
@attraction1.add_photo('dog_fountain.jpg')
@attraction1.save

@attraction2 = Attraction.new(name: 'Odd Sculptures', description: 'Right outside Numazu City Hall.', creator: @user2)
@attraction2.add_photo('weird_shapes.jpg')
@attraction2.save

