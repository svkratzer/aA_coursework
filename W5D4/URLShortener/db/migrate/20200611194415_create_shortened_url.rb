class CreateShortenedUrl < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, null: false, unique: true
      t.string :long_url, null: false
    end
  end
end
