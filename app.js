const fs = require("fs");
const express = require("express");
const morgan = require("morgan");

///Routes

const app = express();

//Middlewares
app.use(express.json());

///Mounting the routes
app.get("/", (req, res) => {
  res.status(200).json({
    status: "Running",
    message: "Home Page",
  });
});

module.exports = app;
