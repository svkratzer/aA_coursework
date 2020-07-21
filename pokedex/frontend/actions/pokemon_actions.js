import {fetchAllPokemon} from '../util/api_util';
import *  as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON'

export const receiveAllPokemon=(pokemon) => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon
    }
}

export const receiveSinglePokemon = (payload) => {
    return {
        type: RECEIVE_SINGLE_POKEMON,
        payload
    }
}




export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)


export const requestSinglePokemon = (id) => (dispatch) => (
    APIUtil.fetchSinglePokemon(id)
        .then(pokemon => dispatch(receiveSinglePokemon(pokemon)))      
)