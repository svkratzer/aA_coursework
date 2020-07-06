//Surrogate Method

Function.prototype.inherits = function (parent) {
  function Surrogate() {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject () {}

MovingObject.prototype.test = function () {
    console.log("Test")
}

function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.shiptest = function () {
    console.log("I am a ship.")
}

function Asteroid () {}
Asteroid.inherits(MovingObject);

const battleship = new Ship
const asteroid = new Asteroid

battleship.test();
battleship.shiptest();
console.log(battleship instanceof Ship);
console.log(battleship.__proto__ === MovingObject.prototype);
console.log(battleship.__proto__ === Ship.prototype);


// Object.create version

