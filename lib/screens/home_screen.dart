import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/save_departamentos.dart';
import 'package:todo_app/models/departamentos.dart';
import 'package:todo_app/widgets/modal_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Departamentos, SaveDepartamentos>(
      builder: (context, departamentosValue, saveDepartamentosValue, child) =>
          Scaffold(
        appBar: AppBar(
          title: const Text('Anotações'),
          centerTitle: true,
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: departamentosValue.departamentosList
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                    color: e.color,
                    child: Center(
                      child: Text(e.title!),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
              context: context,
              builder: (context) => ModalSheet(
                saveDepartamentosValue: saveDepartamentosValue,
                departamentosValue: departamentosValue,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
