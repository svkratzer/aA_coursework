import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const labels = [
    { title: 'one', content: 'There can be only one.' }, 
    { title: 'two', content: 'I am company.' }, 
    { title: 'three', content: 'I\'m a crowd.' }
];

const Root = (props) => {
  return (
      <div id="root">
        <Clock />
        <Tabs labels = {labels} />
      </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root />, main);
});