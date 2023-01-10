import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/models/department.dart';
import 'package:todo_app/models/items.dart';

class ListTableView extends ChangeNotifier {
  Future<List<Department>> getDepartment() async {
    Database db = await DB.instance.database;
    var departments = await db.query('Department', orderBy: 'titleDepartment');

    List<Department> departmentList = departments.isNotEmpty
        ? departments.map((e) => Department.fromMap(e)).toList()
        : [];
    notifyListeners();
    return departmentList;
  }

  Future<List<Items>> getItems(int idDepartment) async {
    Database db = await DB.instance.database;
    var items = await db.query(
      'Items',
      columns: [
        'titleItems',
        'descriptionItems',
        'priceItems',
      ],
    );

    List<Items> itemsList =
        items.isNotEmpty ? items.map((e) => Items.fromMap(e)).toList() : [];
    notifyListeners();
    return itemsList;
  }
}
