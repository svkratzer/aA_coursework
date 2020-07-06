function sum() {
    var sum = 0;

    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

///

function sumRest(...args) {
    var sum = 0;

    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
}

///

Function.prototype.myBind1 = function (ctx) {
    const bindArgs = Array.prototype.slice.call(arguments, 1);
    let that = this;
    return function () { 
      const callArgs = Array.slice.call(arguments);
      return that.apply(ctx, bindArgs.concat(callArgs))
    }
  };

///

Function.prototype.myBind2 = function (ctx, ...bindArgs) {
    return (...callArgs) => {
        this.apply(ctx, bindArgs.concat(callArgs));
    }
};

///

function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach(num => { sum += num; });
      return sum;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

///

Function.prototype.curry1 = function(numArgs) {
    const args = [];
    const func = this;
 
    function _curry(arg) {
        args.push(arg);

        if (args.length === numArgs) {
            return func.apply(null, args);
        } else {
            return _curry
        }
    }
    return _curry
}


Function.prototype.curry2 = function (numArgs) {
  const args = [];
  const func = this;
  function _curry(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return func(...args);
    } else {
      return _curry;
    }
  }
  return _curry;
}

