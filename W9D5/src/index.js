const DomNodeCollection = require('./dom_node_collection.js');

window.$l = () => {

}

// 4 Invocation Styles
// SELECTOR STYLE --> $('article > section') --> returns jQuery object (CSS selector!)
// HTML creator style --> $('<section>')
// .ready() style --> $(()=>{}) execute this after JS files are loaded. put me last!
// wrapper style --> $(node list) the dollar sign turns the obj into a jquery obj!

//                <html>
//                /    \
//            <body>  <head>
//             / \      /   \
//          <p>  <p> <meta> <meta>

// nodes are just the nodes from a node tree! trees are like array-like objs. with parent-child relationships;
// node === js objectified HTML tags *** (html turned into a JS obj) 
// jquery takes raw html obj and we can't call vanilla JS methods on jquery obj;
// active record === takes sql query and turns it into a ruby obj;
// to turn what's not object oriented into something workable within obj oriented environment/methods
