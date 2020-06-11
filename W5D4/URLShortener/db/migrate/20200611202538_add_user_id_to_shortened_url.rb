class AddUserIdToShortenedUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :shortened_urls, :user_id, :integer, null: false
  end
end

