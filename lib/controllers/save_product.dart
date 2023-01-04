import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/product.dart';

class SaveProduct extends ChangeNotifier {
  saveProduct(
    BuildContext context,
    String title,
    String descricao,
    double preco,
    Product value,
  ) {
    final product = Product(
      idProduct: Random().nextDouble().toString(),
      titileProduct: title,
      descriptionProduct: descricao,
      priceProduct: preco,
    );
    value.productList.add(product);
    Navigator.of(context).pop();
    notifyListeners();
  }
}
