const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const httpPort=process.env.NODE_PORT || 3000;

app.get('/personnes', (req, res) => {
    let personnes= [{"id":1, firstName: "Vador", lastName: "Darth"},{"id":2, firstName: "Zinedine", lastName: "Zidane"},{"id":3, firstName: "Diego Armando", lastName: "Maradona"}];
    res.json(personnes);
});

app.listen(httpPort, (err) => {
    console.log(`Express Server is up ..Listening on port ${httpPort}`);
});