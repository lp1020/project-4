class SearchForm extends React.Component {
  render () {
    return (
      <form
      className="search-restaurants-form"
      onSubmit={this.props.handleSearchSubmit}
      >
      <input
      type="text"
      value={this.props.inputSearchValue}
      name="search"
      placeholder="Address"
      onChange={this.props.handleInputSearch}
      /><br/>
      <button id="submit">Show Restaurants</button>
      </form>
      )
  }
}


