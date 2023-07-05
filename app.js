const fs = require("fs");
const express = require("express");
const morgan = require("morgan");
const db = require("./database");
///Routes
const productsRouter = require("./routes/productRoutes");
const app = express();

//Middlewares
app.use(express.json());
app.use((req, res, next) => {
  req.requestTime = new Date().toISOString();
  next();
});
///Mounting the routes
app.use("/api/v1/product", productsRouter);
module.exports = app;
