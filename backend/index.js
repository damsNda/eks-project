const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.get('/personnes', (req, res) => {
    let personnes= [{"id":1, firstName: "Damien", lastName: "N DA"},{"id":2, firstName: "Jeanne", lastName: "N DA"}];
    res.json(personnes);
});

app.listen(5000, (err) => {
    console.log('Listening');
});