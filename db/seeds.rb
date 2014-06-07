# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


users = [{email: "justin@email.com", username: "justin", password: "password", image_url: "http://www.aquariumfish.net/images_01/cambodian_betta_male_120217b6_w0640.jpg"},
				 {email: "daniel@email.com", username: "daniel", password: "password", image_url: "http://www.japantoday.com/images/size/x/2013/10/giraffe.jpg"},
				 {email: "ben@email.com", username: "ben", password: "password", image_url: "http://pets4u.info/wp-content/uploads/2013/11/horse-head.jpg"},
				 {email: "annie@email.com", username: "annie", password: "password", image_url: "http://3.bp.blogspot.com/-DOt_rRESOrU/TjoRdAn7IfI/AAAAAAAACxM/BCJO6oYfads/s1600/cs_goat.jpg"},
				 {email: "mo@email.com", username: "mo", password: "password", image_url: "http://iwall365.com/iPhoneWallpaper/640x960/1307/Lion-face-close-up_640x960_iPhone_4_wallpaper.jpg"}]

User.create!(users)


###FAKER SEED DATA###

#Create Claims
20.times do
	Claim.create!(body: Faker::Lorem.sentence(4),
							 author_id: (rand(5)+1))
end

#Create Arguments
20.times do
	Argument.create!(author_id: (rand(5)+1),
									conclusion_id: (rand(20)+1),
									is_supporting: [true, false].sample)
end

#Create Assumptions
60.times do
	Assumption.create!(argument_id: (rand(20)+1),
										premise_id: (rand(20)+1))
end

#Create votes
200.times do
	Vote.create!(user_id: (rand(5)+1),
					 voteable_id: (rand(20) + 1),
					 voteable_type: ["Claim", "Argument"].sample,
					 value: [true, false].sample)
end






