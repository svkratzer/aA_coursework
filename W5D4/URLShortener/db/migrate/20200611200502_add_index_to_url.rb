class AddIndexToUrl < ActiveRecord::Migration[6.0]
  def change
    add_index(:shortened_urls, :long_url, unique: true)
  end
end
