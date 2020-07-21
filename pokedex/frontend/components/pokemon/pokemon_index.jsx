import React from 'react';

class PokemonIndex extends React.Component {
    constructor (props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }
    
    render() {
        const pokes = this.props.pokemon.map(poke => {
            return (<li key = {poke.id}>{poke.name} 
                    <img src={poke.image_url}></img></li>);
        });

        return (
            <div>
                {pokes}   
            </div>
        )
    }    
}

export default PokemonIndex;

