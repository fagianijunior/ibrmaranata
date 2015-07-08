# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Regular", description: "Can read posts"})
r2 = Role.create({name: "Writer", description: "Can read and create posts. Can update and destroy own posts"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
 
u1 = User.create({name: "Carlos Fagiani Junior", email: "fagianijunior@gmail.com", password: "1qaz2wsx", password_confirmation: "1qaz2wsx", role_id: r1.id})
u2 = User.create({name: "Aletéia Fagiani", email: "ale@g.com", password: "1qaz2wsx", password_confirmation: "1qaz2wsx", role_id: r2.id})
u3 = User.create({name: "Letícia Fagiani", email: "leh@g.com", password: "1qaz2wsx", password_confirmation: "1qaz2wsx", role_id: r3.id})