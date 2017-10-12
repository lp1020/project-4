
class ApiCall extends React.Component {
  constructor() {
    super();
    this.state = {
      restaurants: [],
      inputSearchValue: '',
    }
    this.handleInputSearch = this.handleInputSearch.bind(this);
    this.handleSearchSubmit = this.handleSearchSubmit.bind(this);
  }
  handleInputSearch(event) {
    this.setState({
      inputSearchValue: event.target.value
    })
  }
  handleSearchSubmit(event) {
    event.preventDefault();
    event.target.content = '';
    fetch('https://www.vegguide.org/search/by-address/' + this.state.inputSearchValue).then(function(response){
      console.log('response=',response.url)
    })
    .then((res) => {
      console.log('this is the res.data',res.data);
      console.log(this.state,'state')
      this.setState({
        restaurants: res.entries
      })
      console.log(this.state,'this is the state')
    }).catch(err => console.log(err));
  }
  render () {
    return (
      <div>
      <h1>WELCOME!</h1>
      <SearchForm
      handleInputSearch={this.handleInputSearch}
      handleSearchSubmit={this.handleSearchSubmit}
      inputSearchValue={this.inputSearchValue}
      />
      <RestList
      data={this.state.restaurants} />
      </div>
      )
  }
}

