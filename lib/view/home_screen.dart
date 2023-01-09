import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/models/department.dart';
import 'package:todo_app/view/item_page.dart';
import 'package:todo_app/view_model/list_table_view.dart';
import 'package:todo_app/widgets/dialog_department.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width;
    return Consumer<ListTableView>(
      builder: (context, listTableView, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Lista Compras'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Department>>(
          future: listTableView.getDepartment(),
          builder: (context, AsyncSnapshot<List<Department>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text('Nenhum item adicionado'),
                  )
                : GridView.count(
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: snapshot.data!
                        .map(
                          (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: GestureDetector(
                              onTap: () async {
                                Navigator.pushNamed(
                                  context,
                                  ItemPage.routeItems,
                                  arguments: Department(
                                    titleDepartment: e.titleDepartment,
                                    idDepartment: e.idDepartment,
                                  ),
                                );
                                Database db = await DB.instance.database;

                                var a = await db.query(
                                    'Department INNER JOIN Items ON Department.idDepartment = idDepartment');
                                print(a);
                              },
                              child: Container(
                                color: Color(
                                  int.parse(e.colorDepartment!),
                                ),
                                child: Center(
                                  child: Text(
                                    e.titleDepartment!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => DialogDepartment(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
