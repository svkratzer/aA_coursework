# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  short_url  :string
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    new_url = SecureRandom::urlsafe_base64
    ShortenedUrl.exists?(new_url) ? ShortenedUrl.random_code : new_url
  end

  def self.create(user, long_url)
    ShortenedUrl.create!( {user_iUd:user.id, long_url: long_url, short_url:ShortenedUrl.random_code} )
  end

end
