import 'package:flutter/material.dart';

import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/save_product.dart';
import 'package:todo_app/models/product.dart';

class DialogProduct extends StatelessWidget {
  DialogProduct({
    Key? key,
    required this.saveProductValue,
    required this.productValue,
  }) : super(key: key);
  final SaveProduct saveProductValue;
  final Product productValue;
  final productController = TextEditingController();
  final descricaoController = TextEditingController();
  final precoController = TextEditingController();
  final _productKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _productKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: productController,
                decoration: const InputDecoration(labelText: 'Produto'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: precoController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  if (_productKey.currentState!.validate()) {
                    saveProductValue.saveProduct(
                      context,
                      productController.text,
                      descricaoController.text,
                      double.parse(precoController.text),
                      productValue,
                    );
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_productKey.currentState!.validate()) {
                    final preco = (precoController.text).replaceAll(',', '.');
                    saveProductValue.saveProduct(
                      context,
                      productController.text,
                      descricaoController.text,
                      double.parse(preco),
                      productValue,
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
