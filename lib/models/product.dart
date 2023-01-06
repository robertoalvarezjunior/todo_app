// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  String? idProduct;
  String? titileProduct;
  String? descriptionProduct;
  double? priceProduct;
  Product({
    this.idProduct,
    this.titileProduct,
    this.descriptionProduct,
    this.priceProduct,
  });

  List<Product> productList = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduct': idProduct,
      'titileProduct': titileProduct,
      'descriptionProduct': descriptionProduct,
      'priceProduct': priceProduct,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      idProduct: map['idProduct'] != null ? map['idProduct'] as String : null,
      titileProduct:
          map['titileProduct'] != null ? map['titileProduct'] as String : null,
      descriptionProduct: map['descriptionProduct'] != null
          ? map['descriptionProduct'] as String
          : null,
      priceProduct:
          map['priceProduct'] != null ? map['priceProduct'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
