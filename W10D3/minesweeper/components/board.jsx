import React from "react";
import Tile from './tile';

function Board(props){
    debugger
    const grid = props.board.grid.map((row,idx1) => {
        return (
            <div key={idx1} className="row">
                {row.map ((tile, idx2) => {
                    return(
                        <div key={idx2}>
                            <Tile tile={tile} update={props.update}/>
                        </div>
                    );
                })}
            </div>
          )
    });
    return(
        <div className="grid">
            {grid}
        </div>
    );
}

export default Board;