require 'faker'

puts "clearing db"
# type_array = %w(sport culture indoor outdoor chill relax beach karting)
# activity_array = %w(football cycling parachute kayak climbing)
# activity_address = ["34, boulevard Charles-Livon, Marseille", "42, rue des Petites-Maries, Marseille", "62, boulevard des Dames, Marseille", "30, place Notre-Dame-du-Mont, Marseille", "45, quai de Rive-Neuve, Marseille"]
Booking.destroy_all
Activity.destroy_all
User.destroy_all

admin = User.create!({
  pseudo: "Admin",
  email: 'admin@mail.com',
  password: 'adminadmin'
  })

user1 = User.create!({
  pseudo: "User",
  email: 'user@mail.com',
  password: 'useruser'
  })

puts "done creating users"

# puts "creatin 4 activities for each user"

# User.all.each do |single_user|

#     Activity.create!({
#       name: "Surf",
#       address: 'Marseille, Castellane',
#       type_activity: 'sport',
#       price: 50,
#       description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
#       max_participants: 6,
#       start_date: Faker::Date.forward(10),
#       end_date: Faker::Date.forward(35),
#       seller: single_user,
#       photo: "/../app/assets/images/surf.jpg"
#        })

#     Activity.create!({
#       name: "Skate",
#       address: 'Marseille, Vieux Port',
#       type_activity: 'sport',
#       price: 30,
#       description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
#       max_participants: 10,
#       start_date: Faker::Date.forward(10),
#       end_date: Faker::Date.forward(35),
#       seller: single_user
#        })

#     Activity.create!({
#       name: "Hiking",
#       address: 'Iles du Frioul',
#       type_activity: 'nature',
#       price: 70,
#       description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
#       max_participants: 15,
#       start_date: Faker::Date.forward(10),
#       end_date: Faker::Date.forward(35),
#       seller: single_user
#        })

#     Activity.create!({
#       name: "Cruise",
#       address: 'Marseille, Vieux Port',
#       type_activity: 'outdoor',
#       price: 100,
#       description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
#       max_participants: 30,
#       start_date: Faker::Date.forward(10),
#       end_date: Faker::Date.forward(35),
#       seller: single_user
#        })
# end

# puts "creating activities in Marseille"


# puts "creating Booking linking users& activities"

# 4.times do
#   User.first(10).each do |active_user|
#     Booking.create!({
#       date: Faker::Date.forward(50),
#       participants_number: rand(6),
#       status: "pending",
#       total_price: rand(150),
#       activity: Activity.all.sample,
#       user: active_user
#     })
#   end
# end
# puts " should be linking models"


puts "job's done"

