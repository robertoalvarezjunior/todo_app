import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/department.dart';

class SaveDepartment extends ChangeNotifier {
  SaveDepartment({this.db});
  Database? db;
  saveDepartment(
      BuildContext context, String title, Color color, Department value) async {
    final depart = Department(
      id: Random().nextDouble().toString(),
      title: title,
      color: color,
    );
    value.departmentList.add(depart);
    Navigator.of(context).pop();
    // Cria uma nova tabela chamada "title"
    await db!
        .execute('CREATE TABLE $title (id INTEGER PRIMARY KEY, name TEXT)');

    notifyListeners();
  }
}
