export function selectAllPokemon(state) {
  return Object.values(state.entities.pokemon);
}

export function selectAllItems(state) {
  return Object.values(state.entities.items);
}