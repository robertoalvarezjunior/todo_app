import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/container_color_select.dart';
import 'package:todo_app/controllers/save_departamentos.dart';
import 'package:todo_app/models/departamentos.dart';
import 'package:todo_app/widgets/modal_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width;
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
          childAspectRatio: (itemWidth / itemHeight),
          children: departamentosValue.departamentosList
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: e.color,
                      child: Center(
                        child: Text(
                          e.title!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
              context: context,
              builder: (context) => Consumer<ContainerColorSelect>(
                builder: (context, containerColorSelectValue, child) =>
                    SingleChildScrollView(
                  padding: MediaQuery.of(context).viewInsets,
                  child: ModalSheet(
                    saveDepartamentosValue: saveDepartamentosValue,
                    departamentosValue: departamentosValue,
                    containerColorSelectValue: containerColorSelectValue,
                  ),
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
