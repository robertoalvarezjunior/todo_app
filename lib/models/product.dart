import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  Product({
    this.id,
    this.titulo,
    this.descricao,
    this.preco,
  });
  String? id;
  String? titulo;
  String? descricao;
  double? preco;

  List<Product> productList = [];
}
