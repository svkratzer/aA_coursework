# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user1 = User.create!(username: 'user01')
# user2 = User.create!(username: 'user02')
# user3 = User.create!(username: 'user03')

# artwork1 = Artwork.create!(title: 'Untitled', image_url: "image.com", artist_id: User.last.id)
# artwork2 = Artwork.create!(title: 'Bold & Brash', image_url: "image2.com", artist_id: User.last.id)
# artwork1 = Artwork.create!(title: 'Untitled', image_url: "image.com", artist_id: User.first.id)

# Artwork.create!(title: 'dogs_playing_cards', image_url: "image.com", artist_id: User.second.id)
# Artwork.create!(title: 'midnight_sun', image_url: "image.com", artist_id: User.third.id)

# ArtworkShare.create!(artwork_id: Artwork.first.id, viewer_id: User.first.id)
# ArtworkShare.create!(artwork_id: Artwork.second.id, viewer_id: User.first.id)
# ArtworkShare.create!(artwork_id: Artwork.second.id, viewer_id: User.second.id)
# ArtworkShare.create!(artwork_id: Artwork.second.id, viewer_id: User.third.id)
# ArtworkShare.create!(artwork_id: Artwork.third.id, viewer_id: User.last.id)
# ArtworkShare.create!(artwork_id: Artwork.fourth.id, viewer_id: User.first.id)
# ArtworkShare.create!(artwork_id: Artwork.fourth.id, viewer_id: User.second.id)

Comment.create!(body: "Awesome!", commenter_id: 3, artwork_id: 6)
Comment.create!(body: "What is this trash?", commenter_id: 5, artwork_id: 6)
Comment.create!(body: "I need this", commenter_id: 7, artwork_id: 3)
Comment.create!(body: "Beautiful", commenter_id: 8, artwork_id: 4)
Comment.create!(body: "looks like my child made this", commenter_id: 7, artwork_id: 2)
Comment.create!(body: "5 Stars", commenter_id: 3, artwork_id: 2)
Comment.create!(body: "wowowowowow", commenter_id: 3, artwork_id: 1)
Comment.create!(body: "Amazing", commenter_id: 8, artwork_id: 6)
