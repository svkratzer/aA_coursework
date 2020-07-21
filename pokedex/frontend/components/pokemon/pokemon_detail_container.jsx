import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail' 
import {selectAllItems} from '../../reducers/selectors'

const msp = (state) => {
    return {
    pokemon: state.entities.pokemon,
    items: selectAllItems(state)
    }
}

const mdp = (dispatch) => {
    return {
    requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
    }
}

export default connect(msp,mdp)(PokemonDetail)