# require './models/user.rb'
# require './models/review.rb'
# require './models/property.rb'

Property.destroy_all
Review.destroy_all
User.destroy_all

users = User.create! ([{first_name: "Matt", last_name: "Sullivan", email: "mattbsullivan@gmail.com", hometown: "San Francisco", password:"123456"},{_id: 2, first_name: "Matthew", last_name: "Sullivan", email: "mattbsullivan@gmail.com", password: "1234"}, {first_name: "PeteNut", last_name:"Tapioca", email: "petenut@hotmail.com", password:"minsdom13"}])
properties = Property.create! ([{streetaddress:"8440 Lake Mist Way", city: "Fairfax", state: "Virginia"}])

reviews = Review.create! ([{title:"Bad Man Very Very Bad Man", text:"fldkfjlskjfslfjslfjldkksd", user_id: 1, property_id: 1}])
