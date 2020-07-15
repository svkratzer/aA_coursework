import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root.jsx';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("main");
    ReactDOM.render(<Root />, root);
});
