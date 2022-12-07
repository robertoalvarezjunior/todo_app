import 'package:flutter/material.dart';
import 'package:todo_app/controllers/save_departamentos.dart';
import 'package:todo_app/models/departamentos.dart';

class ModalSheet extends StatelessWidget {
  ModalSheet({
    super.key,
    required this.saveDepartamentosValue,
    required this.departamentosValue,
  });
  final SaveDepartamentos saveDepartamentosValue;
  final Departamentos departamentosValue;
  final departamentosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: departamentosController,
          ),
          ElevatedButton(
            onPressed: () {
              final departText = departamentosController.text;
              saveDepartamentosValue.saveDepartamentos(
                context,
                departText,
                Colors.blue,
                departamentosValue,
              );
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
