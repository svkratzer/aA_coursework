import React from 'react';
import ReactDOM from 'react-dom';

import Root from './frontend/root.jsx';

document.addEventListener("DOMContentLoaded", () => {
    const names = ['Abba', 'Barney', 'Barbara', 'Jeff', 'Jenny', 'Sarah', 'Sally', 'Xander'];
    const root = document.getElementById("root");
    ReactDOM.render(<Root names={names}/>, root);
    // new Clock(arg1, arg2);   <-- regular javascript 
    // <Clock arg1 = "arg1value" arg2 = "arg2value" />  <-- react syntax


});
