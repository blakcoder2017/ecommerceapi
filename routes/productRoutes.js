const express = require("express");

const {
  getAllProducts,
  getProduct,
  createProduct,
  updateProducts,
  deleteProducts,
  checkProductID,
  checkBody,
} = require("./../controllers/productsController");

const router = express.Router();

router.param("id", checkProductID);
router.route("/").get(getAllProducts).post(checkBody, createProduct);
router.route("/:id").get(getProduct).patch(updateProducts).delete(deleteProducts);

module.exports = router;
