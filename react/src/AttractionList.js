import React from 'react';
import Attraction from './Attraction';

const AttractionList = props => {
let attractions = props.attractions.map(attraction => {
  return (
    <Attraction
      key={attraction.id}
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
