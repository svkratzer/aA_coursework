# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  commenter_id :integer          not null
#  artwork_id   :integer          not null
#
class Comment < ApplicationRecord

    validates :body, presence: true
    validates :commenter_id, presence: true
    validates :artwork_id, presence: true

    belongs_to :artwork,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork

    belongs_to :author, 
    primary_key: :id, 
    foreign_key: :commenter_id,
    class_name: :User

end 
