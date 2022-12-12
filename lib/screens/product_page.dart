import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/save_product.dart';
import 'package:todo_app/models/product.dart';
import 'package:todo_app/widgets/dialog_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });

  static const routeProductName = '/productPage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;
    return Consumer2<Product, SaveProduct>(
      builder: (context, productValue, saveProductValue, child) => Scaffold(
        appBar: AppBar(
          title: Text('${args.titulo}'),
          centerTitle: true,
        ),
        body: ListView(
            children: productValue.productList
                .map(
                  (e) => ListTile(
                    title: Text(e.titulo!),
                    subtitle: Text(e.descricao!),
                  ),
                )
                .toList()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => DialogProduct(
                productValue: productValue,
                saveProductValue: saveProductValue,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
