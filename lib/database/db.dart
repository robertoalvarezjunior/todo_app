import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;
  static List<String> q = [];

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'lista_compras.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {},
    );
  }

  Future<void> criarBanco(Database db) async {
    for (String query in q) {
      await db.execute(query);
    }
  }
}
