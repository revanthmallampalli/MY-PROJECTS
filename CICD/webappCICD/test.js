const request = require('supertest');
const express = require('express');

const app = express();
app.get('/', (req, res) => {
  res.send('Hello, world!');
});

describe('GET /', () => {
  it('responds with Hello, world!', (done) => {
    request(app)
      .get('/')
      .expect('Hello, world!', done);
  });
});
