import React from 'react';

const Attraction = props => {
  return (
    <div>
      <h1>{props.name}</h1>
      <img src={props.url}/>
    </div>
  );
};

export default Attraction;
