# project-4

## **Cruelty-Free-4-Me**
### **Your destination for all things cruelty-free!** 

### **FEATURES**
This is a full CRUD  application that allows the user to Create, Read, Update and Delete from a local animal database.

The user can also register in the website, create an account and log-in.

### **TECHNOLOGIES**
- BACK-END: Postgres (pg-promise) & Express
- FRONT-END: React
- HTML5
- CSS3 
- NPM packages:
    - nodemon
    - morgan
    - express
    - body-parser
    - Pg-promise
    - axios
    - cors
    - dotenv
    - webpack
    - yelp-fusion
    - bcrypt
    - jsonwebtoken
    - "cookie-parser": "^1.4.3"



----------------------------
### **USER STORIES**

![User stories](./public/images/UserStories.png)



----------------------------
### **WIREFRAMES**

![Home Page](./public/images/HomePage.png)

![Register](./public/images/Register.png)

![Login](./public/images/Login.png)

![Search results](./public/images/SearchResults.png)

![Single Animal](./public/images/SingleAnimal.png)

![Add/edit form](./public/images/AddEdit_form.png)

---------------------------------

### **CODE SNIPPET**

## **YELP CALL**

```
const yelp = require('yelp-fusion');
function yelpCall(id, secret, locale) {
  const searchRequest = {
    term: 'Animal Shelters',
    location: locale,
  };

/*
  return the authentication results for the yelp header
  first because It is needed for the retreival of the actual api data call.
*/
  return yelp.accessToken(id, secret)
    .then(res => {
      const client = yelp.client(res.jsonBody.access_token);
/*
  return the actual search method. Cut and moved the promise to server.js. It needed to me moved there because the result was not being returns at the server.js
*/
      return client.search(searchRequest)
/* .then(shelter => {
          const results = shelter.jsonBody.businesses[0];
          console.log(results)

    -promise here before. It was moved to the server.js because that is where we need the data.
*/
    })
    .catch(err => {console.log(err);})
}

module.exports = yelpCall

```
---------------------------------

### **CHALLENGES**

1. **PLAN THE COMPONENTS STRUCTURE**:  it wasn't easy to find the right structure that fit our needs. We changed it many times, we added also some partials because we were working with conditional rendering. One of the hardest thing has been connecting them properly one to another. 

2. **PASSING PROPS AND STATES!**  the React logic is undoubtedly well structured but still difficult to understand if you still don't hve so much practice. We had a VERY hard time figuring out how and what to pass from one component to the other.

3. **YELP CALL**: We've never worked with an external and a local API at the same time, so it wasn't easy.

4. **AUTHENTICATION**: we definetely need to spend more time on that, it was really time-consuming, mostly because it' still hard for us to fully understand how it practically works and how to use the different packages to handle the authentication process.
---------------------------------

### **FUTURE IMPROVEMENTS**

- Add a "favorite" page where the user can save the animals he would like to adopt;
- Add an "adopted animal" page where to store all the adopted animal;
- Extend the API calls to more than one shelter per borough.
- Add roles for the registered users.
---------------------------------
