import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/models/items.dart';
import 'package:todo_app/models/department.dart';

class TableFunctions extends ChangeNotifier {
  Future<void> insertList(
    Department list,
  ) async {
    Database db = await DB.instance.database;

    await db.transaction(
      (txn) async {
        await txn.insert(
          'Department',
          list.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
    notifyListeners();
  }

  Future<void> insertItemsList(
    Items items,
  ) async {
    Database db = await DB.instance.database;
    await db.transaction(
      (txn) async {
        await txn.insert(
          'Items',
          {'': items.toMap()},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
    notifyListeners();
  }
}
