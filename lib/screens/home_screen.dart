import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/controllers/save_department.dart';
import 'package:todo_app/database/db.dart';
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
                        arguments: Product(titileProduct: e.titleDepart),
                      );
                    },
                    child: Container(
                      color: e.colorDepart,
                      child: Center(
                        child: Text(
                          e.titleDepart!,
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
          onPressed: () async {
            Database db = await DB.instance.database;

            List<Map<String, dynamic>> users = await db
                .query('test INNER JOIN casa ON test.test_id = test_id');

            Future<void> insertUser(Database db, String name) async {
              // Insere um novo usuário na tabela users

              // await db.execute(
              //   'CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, test_id INTEGER, value TEXT, FOREIGN KEY(test_id) REFERENCES casa(id_depart))',
              // );

              await db.insert(
                'casa',
                {'title_depart': name},
                conflictAlgorithm: ConflictAlgorithm.replace,
              );
              // await db.insert('test', {'test_id': 1, 'value': 'funfu'});
            }

            await insertUser(db, 'casa');
            print(users);
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
