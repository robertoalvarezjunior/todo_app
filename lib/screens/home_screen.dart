import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/save_department.dart';
import 'package:todo_app/models/department.dart';
import 'package:todo_app/models/product.dart';
import 'package:todo_app/screens/product_page.dart';
import 'package:todo_app/widgets/dialog_department.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width;
    return Consumer2<Department, SaveDepartment>(
      builder: (context, departamentosValue, saveDepartamentosValue, child) =>
          Scaffold(
        appBar: AppBar(
          title: const Text('Lista Compras'),
          centerTitle: true,
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          children: departamentosValue.departmentList
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductPage.routeProductName,
                        arguments: Product(titulo: e.title),
                      );
                    },
                    child: Container(
                      color: e.color,
                      child: Center(
                        child: Text(
                          e.title!,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
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
            showDialog(
              context: context,
              builder: (context) => DialogDepartment(
                saveDepartmentValue: saveDepartamentosValue,
                departmentValue: departamentosValue,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
