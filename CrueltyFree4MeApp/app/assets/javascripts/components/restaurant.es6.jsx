class Restaurant extends React.Component {
  render () {
    return (
      <div className="restaurantInfo">
      {this.props.restaurant.entries}
      </div>
      )
  }
}


