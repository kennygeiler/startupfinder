require 'faker'

Post.create(title: 'yo', link: 'http://www.google.com', description: Faker::Lorem.sentence, hiring: false, staff_pick: true, user_id: 1)
Post.create(title: 'guuco', link: 'http://www.yahoo.com', description: Faker::Lorem.sentence, hiring: true, staff_pick: false, user_id: 1)
Post.create(title: 'yolo', link: 'http://www.face.com', description: Faker::Lorem.sentence, hiring: false, staff_pick: false, user_id: 2)
Post.create(title: 'turnupo', link: 'http://www.nppl.com', description: Faker::Lorem.sentence, hiring: true, staff_pick: true, user_id: 2)


10.times do
  Post.create(title: Faker::Company.name, link: Faker::Internet.url, description: Faker::Lorem.sentence, hiring: true, staff_pick: true, user_id: 1)
end

10.times do
  Post.create(title: Faker::Company.name, link: Faker::Internet.url, description: Faker::Lorem.sentence, hiring: true, staff_pick: true, user_id: 1, accepted: true)
end

10.times do
  Post.create(title: Faker::Company.name, link: Faker::Internet.url, description: Faker::Lorem.sentence, hiring: true, staff_pick: false, user_id: 1)
end

10.times do
  Post.create(title: Faker::Company.name, link: Faker::Internet.url, description: Faker::Lorem.sentence, hiring: true, staff_pick: false, user_id: 1, accepted: true)
end

User.create(name: 'kenny')
User.create(name: 'john')
