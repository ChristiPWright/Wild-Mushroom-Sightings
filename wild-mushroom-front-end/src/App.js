import React from 'react';
import './App.css';

class App extends React.Component{
  constructor(props){
    super(props)
    this.state= {
      mushroomBackend: [],
      error: null,
    }
    this.getMushrooms()
  }
  
  getMushrooms = () => {
    fetch("http://18.217.188.159:8080/mushrooms")
    .then((resp)=>{
      return resp.json()
    })
    .then((mushrooms)=>{
      this.setState({mushroomBackend: mushrooms })
    })
    .catch((error)=>{
      this.setState({error: 'Sorry, there was a problem.'})
    })
  }
  
  render(){
    const {error, mushroomBackend} = this.state
    return (
      <div className="App">
        <h1>The Mushroom Types</h1>
        {error &&
          <div>
            <bold>{error}</bold>
          </div>
        }
        <ul>
        {mushroomBackend.map((mushroom, index)=>{
          return(<li key={index}>{mushroom.common_name}</li>)
        })}
        </ul>
      </div>
    );
  }
  
}

export default App;
