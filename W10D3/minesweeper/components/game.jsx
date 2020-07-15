import React from "react";
import * as Minesweeper from "../minesweeper.js"
import Board from './board';

class Game extends React.Component {
    constructor(){
        super();
        this.state = {
                board: new Minesweeper.Board(9,5)
        };
        this.updateGame = this.updateGame.bind(this);
        this.gameOver = this.gameOver.bind(this);
    }
    
  updateGame(tile, altkey) {
      if(altkey){
        tile.toggleFlag();
      }else{
        tile.explore();
      }
      this.state.board.lost();
      this.state.board.won(); 
    this.setState({ board: this.state.board });
  }

  gameOver() {
    if (this.state.board.lost()) {
      return (
        <div>
          <p>
            You lost!
          </p>
          <button>
            Play Again
          </button>
        </div>
      );
    } else if (this.state.board.won()) {
      return (
        <div>
          <p>
            You won!
          </p>
          <button>
            Play Again
          </button>
        </div>
      );
    }
  }

  render() {
    const board = <Board board={this.state.board} update={this.updateGame}/>;
    return (
      <div className="game">
        <h1>Minesweeper</h1>
        <div className="instruction">
          <p>Click to explore a tile.</p>
          <p>Alt + Click to flag a tile.</p>
        </div>
        <div className="board">
            {board}
        </div>
        <div className="end">
            {this.gameOver()}
        </div> 
      </div>
    );
  }

}

export default Game;