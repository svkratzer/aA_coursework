import React from "react";
import ReactDOM from "react-dom";
import configStore from './store/store';
import Root from './components/root'


// TESTING IMPORTS
import {fetchAllPokemon, fetchSinglePokemon} from './util/api_util';
import {receiveAllPokemon} from './actions/pokemon_actions';
import pokemonReducer from './reducers/pokemon_reducer';
import entitiesReducer from './reducers/entities_reducer';
import rootReducer from './reducers/root_reducer';
import {requestAllPokemon} from './actions/pokemon_actions';
import {selectAllPokemon} from './reducers/selectors';
import {requestSinglePokemon, receiveSinglePokemon} from './actions/pokemon_actions';

document.addEventListener("DOMContentLoaded", () => {
  const store = configStore()
  
  //testing only
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.pokemonReducer = pokemonReducer;
  window.entitiesReducer = entitiesReducer;
  window.rootReducer = rootReducer;
  window.getState = store.getState; 
  window.dispatch = store.dispatch
  window.requestAllPokemon = requestAllPokemon;   
  window.selectAllPokemon = selectAllPokemon;
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.receiveSinglePokemon = receiveSinglePokemon;
  window.requestSinglePokemon = requestSinglePokemon;

    const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});