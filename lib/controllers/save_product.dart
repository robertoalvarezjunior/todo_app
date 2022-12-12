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
      id: Random().nextDouble().toString(),
      titulo: title,
      descricao: descricao,
      preco: preco,
    );
    value.productList.add(product);
    Navigator.of(context).pop();
    notifyListeners();
  }
}
