import React, {Component} from 'react';
import AttractionList from './AttractionList';

class Attractions extends Component {
  constructor(props){
    super(props);
    this.state = {
      attractions: [],
    };
  }

  componentDidMount(){
    $.ajax({
      url: '/api/v1/attractions',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({attractions: data});
    });
  }
  render(){
        return (
          <AttractionList attractions={this.state.attractions}/>
            );
          }
        }
        export default Attractions;
