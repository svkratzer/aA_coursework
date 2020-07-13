/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DomNodeCollection{ // \"myJQueryObj\"; dom_node === singular instance of html element/tag\n    constructor(nodes){ // array of html elements; pass node list into jquery...? node tree?\n        this.nodes = nodes;\n    }\n\n    html(html) { // <title>jQuery Lite</title>\n        if(typeof html === \"string\"){ // setter\n            this.nodes.forEach(node => {\n                node.innerHTML = html;\n                // .tojQueryObj (turn it into a jquery method)\n            })\n        }else if(html === undefined){ // getter for the first node in the list\n            this.nodes[0].innerHTML;\n        }\n    }\n\n    empty(){\n        this.html('');\n    }\n\n    append(childNode){\n        if(typeof childNode === \"string\"){\n            this.nodes.forEach(node => {\n                node.innerHTML += childNode;\n            })\n        }else if(childNode instanceof DomNodeCollection){ // jquery obj\n            this.nodes.forEach(node => {\n                childNode.nodes.forEach(child => { // this - childNode\n                    node.appendChild(child); // .appendChild() --> JS method;\n                })\n            })\n        }else if(typeof childNode === \"object\"){ // HTML elements\n        //  HTMLElement parent of another class called \"Element\";\n        // HTMLElement --> Element --> Node --> EventTarget\n        let newdoms = new DomNodeCollection([childNode])\n            this.nodes.forEach(node => {\n                  newdoms.nodes.forEach(child => { // this - childNode\n                    node.appendChild(child); // .appendChild() --> JS method;\n                })\n            })\n      } \n\n    }\n    // document.create('li') --> creates <li></li> === HTML element;\n\n    attr(){\n\n    }\n\n    addClass(){\n\n    }\n\n    removeClass(){\n\n    }\n}\n\nmodule.exports = DomNodeCollection;\n\n// to build our own version of jquery!\n// b/c vanilla JS doesnt have jquery methods; \n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DomNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.$l = () => {\n\n}\n\n// 4 Invocation Styles\n// SELECTOR STYLE --> $('article > section') --> returns jQuery object (CSS selector!)\n// HTML creator style --> $('<section>')\n// .ready() style --> $(()=>{}) execute this after JS files are loaded. put me last!\n// wrapper style --> $(node list) the dollar sign turns the obj into a jquery obj!\n\n//                <html>\n//                /    \\\n//            <body>  <head>\n//             / \\      /   \\\n//          <p>  <p> <meta> <meta>\n\n// nodes are just the nodes from a node tree! trees are like array-like objs. with parent-child relationships;\n// node === js objectified HTML tags *** (html turned into a JS obj) \n// jquery takes raw html obj and we can't call vanilla JS methods on jquery obj;\n// active record === takes sql query and turns it into a ruby obj;\n// to turn what's not object oriented into something workable within obj oriented environment/methods\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });