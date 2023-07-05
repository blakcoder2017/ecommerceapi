const dotenv = require("dotenv");
dotenv.config({ path: "./config.env" });
const mysql = require("mysql");
const app = require("./app");

const dbConnection = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
});

dbConnection.connect((err) => {
  if (err) {
    console.log("Error connecting to the database", err);
  } else {
    console.log("Connection successful");
  }
});

const port = process.env.PORT || 5000;

app.listen(port, () => {
  console.log(`Server is running on port: ${port}`);
});
