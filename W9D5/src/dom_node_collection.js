class DomNodeCollection{ // "myJQueryObj"; dom_node === singular instance of html element/tag
    constructor(nodes){ // array of html elements; pass node list into jquery...? node tree?
        this.nodes = nodes;
    }

    html(html) { // <title>jQuery Lite</title>
        if(typeof html === "string"){ // setter
            this.nodes.forEach(node => {
                node.innerHTML = html;
                // .tojQueryObj (turn it into a jquery method)
            })
        }else if(html === undefined){ // getter for the first node in the list
            this.nodes[0].innerHTML;
        }
    }

    empty(){
        this.html('');
    }

    append(childNode){
        if(typeof childNode === "string"){
            this.nodes.forEach(node => {
                node.innerHTML += childNode;
            })
        }else if(childNode instanceof DomNodeCollection){ // jquery obj
            this.nodes.forEach(node => {
                childNode.nodes.forEach(child => { // this - childNode
                    node.appendChild(child); // .appendChild() --> JS method;
                })
            })
        }else if(typeof childNode === "object"){ // HTML elements
        //  HTMLElement parent of another class called "Element";
        // HTMLElement --> Element --> Node --> EventTarget
        let newdoms = new DomNodeCollection([childNode])
            this.nodes.forEach(node => {
                  newdoms.nodes.forEach(child => { // this - childNode
                    node.appendChild(child); // .appendChild() --> JS method;
                })
            })
      } 

    }
    // document.create('li') --> creates <li></li> === HTML element;

    attr(){

    }

    addClass(){

    }

    removeClass(){

    }
}

module.exports = DomNodeCollection;

// to build our own version of jquery!
// b/c vanilla JS doesnt have jquery methods; 