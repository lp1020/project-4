class RestList extends React.Component {
  render () {
    return (
      <div>
      { this.props.data.map((restaurant, i) => {
        return <Restaurant restaurant={restaurant} key={restaurant.id} />
      })}
      </div>
      )
  }
}


