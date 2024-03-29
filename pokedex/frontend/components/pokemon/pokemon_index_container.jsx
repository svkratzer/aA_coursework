import { connect } from 'react-redux';
import {selectAllPokemon} from '../../reducers/selectors'
import PokemonIndex from './pokemon_index' 

const msp = (state) => {
    return {
        pokemon: selectAllPokemon(state)
    }
};

const mdp = (dispatch) => {
    return {
        requestAllPokemon: () => dispatch(requestAllPokemon())
    }
};

export default connect(msp,mdp)(PokemonIndex);
