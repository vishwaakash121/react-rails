import React, { useEffect, useState } from 'react'
import axios from 'axios'
import Header from './Header'

const Airline = (props) => {
  const [airline, setAirline] = useState({})
  const [review, setReview] = useState({})
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    // Get specific airline
    const slug = props.match.params.slug
    const url = `/api/v1/airlines/${slug}`
    axios.get(url)
    .then( resp => {
      setAirline(resp.data)
      setLoaded(true)
      console.log(loaded);
      console.log(airline);
    })
    .catch( resp => console.log(resp))
  }, [airline])

	return (
    <div className="wrapper">
      <div className="column">
        ( 
          <Header
            attributes={airline.data.attributes}
            reviews={airline.included}
          />
        )
        <div className="reviews">
        </div>
      </div>
      <div className="column">
        <div className="review-form">review form here</div>
      </div>
    </div>
  )
}

export default Airline