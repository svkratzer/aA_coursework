import React from 'react';
import fetchSinglePokemon from '../../util/api_util'

class PokemonDetail extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }

    render(){
        const { pokemon, items } = this.props;
        const itemLis = items.map((item) => {
          return (
            <li key={item.id}>
              {item.name}
              <a href="#">
                <img src={item.image_url} />
              </a>
            </li>
          );
        });
        return(
          <>
            <ul>
                <li>
                   <h2>{pokemon.name}</h2>  
                </li>
                <li>Type: {pokemon.type}</li>   
                <li>Attack: {pokemon.attack}</li>   
                <li>Defense: {pokemon.defense}</li>
                <li>Moves: {pokemon.moves}</li>
            </ul>
            <ul>
              {itemLis}
            </ul>
          </>
        )
    }
}

export default PokemonDetail;