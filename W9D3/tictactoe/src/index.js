const View = require("./ttt-view.js");
const Game = require("./game.js");


  $( () => {
	  const rootEl = $('.ttt');
	  const game = new Game();
	  new View(game, rootEl);
	});





// $(applyListeners); 


// applyListeners();   
// $(document).ready(applyListeners);
// $(applyListeners);  // 4th use of `$`: add a document-ready callback 