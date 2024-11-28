// src/index.js

const express = require('express'); //This line imports the express module
const app = express();              //express() creates an instance of an Express application, which you can use to define routes, handle requests, and configure middleware.
const port = 3000;                  //defines the port on which the server will listen for incoming requests.

app.get('/', (req, res) => {        //defines a GET route for the root path (/)
  res.send('Hello, World!');        
});

app.listen(port, () => {           ////ells the  app to listen for incoming requests on the specified port (3000).
  console.log(`Server is running on http://localhost:${port}`);
});
