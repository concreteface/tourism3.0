import React from 'react';
import Attraction from './Attraction';

const AttractionList = props => {
let attractions = props.attractions.map((attraction, index) => {
  return (
    <Attraction
      key={index}
      name={attraction.name}
      url={attraction.photo.photo.url}
    />
  );
});

  return (
    <div>
      {attractions}
    </div>
  );
};

export default AttractionList;
