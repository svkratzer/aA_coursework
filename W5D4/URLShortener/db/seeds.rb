# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create( email: "user_1@gmail.com" )
User.create( email: "user-two@comcast.net" )
User.create( email: "user3@yahoo.com")

# url = ShortenedUrl.create(User.first, "www.facebook.com")
# url2 = ShortenedUrl.create( User.last, "www.google.com")
url3 = ShortenedUrl.create( User.first, "www.face.com")
# url4 = ShortenedUrl.create( User, "www.faook.com")