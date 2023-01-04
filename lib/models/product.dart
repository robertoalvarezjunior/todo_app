import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  Product({
    this.idProduct,
    this.titileProduct,
    this.descriptionProduct,
    this.priceProduct,
  });
  String? idProduct;
  String? titileProduct;
  String? descriptionProduct;
  double? priceProduct;

  List<Product> productList = [];
}
