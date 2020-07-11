

function MovingObject(name) {
    this.name = name
}

MovingObject.prototype.move = function() {
    console.log(`${this.name} + hi`) 
}

function fastObject(name) {
    MovingObject.call(this, name);
}

fastObject.prototype.fast = function() {
    console.log("move fast")
}

Function.prototype.inherit = function(ParentClass) {
    function Surrogate () {};
    Surrogate.prototype = ParentClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this; 
}

fastObject.inherit(MovingObject);
f = new fastObject("mac");
s = new MovingObject("Sam");

console.log(f.move());
console.log(s.move());

// console.log(f)



















const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
});

