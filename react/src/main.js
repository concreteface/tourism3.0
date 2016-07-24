import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Attractions from './Attractions';


$(function() {
  ReactDOM.render(
    <Attractions />,
    document.getElementById('app')
  );
});
