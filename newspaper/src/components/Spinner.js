import React, { Component } from 'react'
import loading from './spinner.gif'

export default class Spinner extends Component {
  render() {
    return (
      <div className='container text-center'>
        <img src={loading}/>
      </div>
    )
  }
}
