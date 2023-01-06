import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TableConfig extends ChangeNotifier {
  createNewTable(String tableName, Database db) async {
    // Insere um novo usuário na tabela users
    // await db.transaction(
    //   (txn) async => await txn.execute(
    //     '''CREATE TABLE $tableName (
    //     id_product INTEGER PRIMARY KEY AUTOINCREMENT,
    //     list_id INTEGER,
    //     title_product TEXT,
    //     description_product TEXT,
    //     price_produt REAL,
    //     FOREIGN KEY(list_id) REFERENCES list(id_list))''',
    //   ),
    // );

    await db.execute(
      '''CREATE TABLE $tableName (
        id_product INTEGER PRIMARY KEY AUTOINCREMENT, 
        list_id INTEGER, 
        title_product TEXT,
        description_product TEXT,
        price_produt REAL, 
        FOREIGN KEY(list_id) REFERENCES list(id_list))''',
    );

    notifyListeners();
  }

  insertNewElement(Database db, String titleProduct, String descProduct,
      double price) async {
    // primeiro criar o banco, depois pedir para printar
    List<Map<String, dynamic>> users =
        await db.query('test INNER JOIN list ON test.list_id = list_id');

    await db.insert('test', {
      'list_id': 2,
      'title_product': titleProduct,
      'description_product': descProduct,
      'price_produt': price,
    });
    print(users);
    notifyListeners();
  }
}
