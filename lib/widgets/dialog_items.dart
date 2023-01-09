import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/database/table_functions.dart';
import 'package:todo_app/models/items.dart';

class DialogItems extends StatelessWidget {
  DialogItems({
    Key? key,
  }) : super(key: key);
  final itemTitleController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final priceController = TextEditingController();
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
                controller: itemTitleController,
                decoration: const InputDecoration(labelText: 'Nome Item'),
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
                controller: itemDescriptionController,
                decoration: const InputDecoration(labelText: 'Descrição Item'),
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
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  if (_productKey.currentState!.validate()) {}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Consumer<TableFunctions>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    if (_productKey.currentState!.validate()) {
                      final price = double.parse(
                          (priceController.text).replaceAll(',', '.'));
                      final titleItem = itemTitleController.text;
                      final desciptionItem = itemDescriptionController.text;

                      value.insertItemsList(
                        Items(
                          titleItems: titleItem,
                          descriptionItems: desciptionItem,
                          priceItems: price,
                        ),
                      );
                      Navigator.of(context).pop();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
