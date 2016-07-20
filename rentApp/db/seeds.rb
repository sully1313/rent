# require './models/user.rb'

# require './models/property.rb'

Property.destroy_all
User.destroy_all


users = User.create! ([{first_name: "Matt", last_name: "Sullivan", email: "mattbsullivan@gmail.com", hometown: "San Francisco", password:"123456"}, {first_name: "Matthew", last_name: "Sullivan", email: "mattbsullivan@gmail.com", password: "1738hello"}, {first_name: "PeteNut", last_name: "Tapioca",
email: "petenut@hotmail.com", password: "minsdom13"}])
properties = Property.create! ([{streetaddress:"8440 Lake Mist Way", city: "Fairfax", state: "Virginia", latitude: "36.1699412",
longitude: "-115.13982959999"}])
