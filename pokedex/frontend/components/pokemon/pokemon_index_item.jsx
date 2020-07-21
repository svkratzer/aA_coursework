import React from 'react';
import { Link } from 'react-router-dom';


export default ({pokemon})=> {
    // debugger;
    return (<li key={pokemon.id}>
        <Link to={`/pokemon/${pokemon.id}`}>
            {pokemon.id}
            <img src={pokemon.image_url}></img>
            {pokemon.name}
        </Link>
    </li>);
} 