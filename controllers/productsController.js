const db = require("./../database");

///Middlewares
exports.checkProductID = (req, res, next) => {
  const newID = req.params.id;
  db.query("SELECT * FROM product WHERE productID=?", [newID], (err, data) => {
    if (data.length === 0) {
      return res.status(404).json({
        status: "Fail",
        message: "Invalid Product ID. Please enter a valid product ID.",
      });
    }
  });
  next();
};

exports.checkBody = (req, res, next) => {
  if (!req.body.ProductID || !req.body.ProductName || !req.body.DepartmentID) {
    return res.status(400).json({
      status: "fail",
      message: "Missing important data",
    });
  }
  next();
};

//CRUD operations
exports.getAllProducts = (req, res) => {
  db.query("SELECT * FROM product", (err, data) => {
    if (err) {
      console.error(err);
    } else {
      res.status(200).json({
        status: "success",
        requestTimme: req.requestTime,
        data: data,
      });
    }
  });
};

exports.getProduct = (req, res) => {
  const newId = req.params.id;
  db.query("SELECT * FROM product WHERE productID=?", [newId], (err, data) => {
    res.status(201).json({
      status: "success",
      data: data,
    });
  });
};

exports.createProduct = (req, res) => {
  const {
    ProductID,
    DepartmentID,
    Category,
    IDSKU,
    ProductName,
    Quantity,
    UnitPrice,
    Ranking,
    ProductDesc,
    UnitsInStock,
    UnitsInOrder,
    Picture,
  } = req.body;
  let insertQuery =
    "INSERT INTO product (ProductID,DepartmentID,Category,IDSKU,ProductName,Quantity,UnitPrice,Ranking,ProductDesc,UnitsInStock,UnitsInOrder,Picture) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
  let query = db.format(insertQuery, [
    ProductID,
    DepartmentID,
    Category,
    IDSKU,
    ProductName,
    Quantity,
    UnitPrice,
    Ranking,
    ProductDesc,
    UnitsInStock,
    UnitsInOrder,
    Picture,
  ]);
  db.query(query, (error) => {
    if (error) {
      console.log(error);
    }
    res.status(201).json({
      status: "success",
      message: "Product saved successfully",
    });
  });
};

exports.updateProducts = (req, res) => {
  res.status(200).json({
    status: "success",
    requestTimme: req.requestTime,
    message: "Update a single product via this route",
  });
};

exports.deleteProducts = (req, res) => {
  res.status(204).json({
    status: "success",
    requestTimme: req.requestTime,
    message: "delete a single product via this route",
  });
};
