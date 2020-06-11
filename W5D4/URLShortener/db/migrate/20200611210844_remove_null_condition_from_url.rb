class RemoveNullConditionFromUrl < ActiveRecord::Migration[6.0]
  def change
    remove_column :shortened_urls, :short_url
    add_column :shortened_urls, :short_url, :string
  end
end
