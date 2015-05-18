# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(title: 'yo', link: 'google.com', hiring: false, staff_pick: true, user_id: 1)
Post.create(title: 'guuco', link: 'yahoo.com', hiring: true, staff_pick: false, user_id: 1)
Post.create(title: 'yolo', link: 'face.com', hiring: false, staff_pick: false, user_id: 2)
Post.create(title: 'turnupo', link: 'nppl.com', hiring: true, staff_pick: true, user_id: 2)

User.create(username: 'kenny', email: 'kenny@aol.com', password: '123')
User.create(username: 'john', email: 'john@aol.com', password: '123')