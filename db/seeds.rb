# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create! :email => 'customer@gmail.com', :password => 'password', :password_confirmation => 'password', :name => "user1"
User.create! :email => 'manager@gmail.com', :password => 'password', :password_confirmation => 'password', :role => 'manager', :name => "manager"