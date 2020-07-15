import React from 'react';

class Tile extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            revealed: false,
            bombed: false, 
            flagged: false
        }
        this.isRevealed = this.isRevealed.bind(this);
        this.isBombed = this.isBombed.bind(this);
        this.isFlagged = this.isFlagged.bind(this);

        this.returnTile = this.returnTile.bind(this);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(event){
        event.preventDefault();
        const updateGame = this.props.update;
        if (event.altKey) {
            updateGame(this.props.tile, true);
        }else{
            updateGame(this.props.tile, false);
        }
    }

    isRevealed(){
        if(this.props.tile.explored) this.setState({revealed: true});
        return this.state.revealed;
    }

    isBombed(){
        if(this.props.tile.bombed) this.setState({bombed: true});
        return this.state.bombed;
    }

    isFlagged() {
        if(this.props.tile.flagged) this.setState({flagged: true});
        return this.state.flagged;
    }

    // returnTile() {
    //  if (this.isRevealed() && this.props.tile.adjacentBombCount() >= 1) {
    //     return (<div className="explored">{this.props.tile.adjacentBombCount()}</div>);
    //   } else if (this.isBombed()) {
    //         return (<div className="bombed">💣</div>);
    //   } else if (this.isFlagged()) {
    //         return (<div className="flagged">&#9872;</div>);
    //   } else {
    //     return (<div className="raw-tile"></div>);
    //   }
    // }
    returnTile() {
        if (this.props.tile.explored){ 
            if (this.props.tile.bombed) {
                return (<div className="bombed">💣</div>);
            } else if (this.props.tile.adjacentBombCount() >= 1) {
                return (<div className="explored">{this.props.tile.adjacentBombCount()}</div>);
            }else{
                return (<div className="explored"></div>);
            }
        } else if (this.props.tile.flagged) {
            return (<div className="flagged">&#9872;</div>);
        } else {
            return (<div className="raw-tile"></div>);
        }
    }

// const div = document.fffcsasvadfgf
// div.addEventListener('click' event => {

// })

    render() {

        return(
            <div className="tile" onClick={event => this.handleClick(event)}>
                {this.returnTile()}
            </div>
        );
    }
}

export default Tile;

