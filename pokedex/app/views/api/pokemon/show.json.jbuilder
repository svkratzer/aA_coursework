json.pokemon do 
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end

json.items do
  @pokemon.items.each do |item|
    json.set! item.id do 
      json.extract! item, :pokemon_id, :name, :price, :happiness
      json.image_url asset_path(item.image_url)
    end
  end
end
