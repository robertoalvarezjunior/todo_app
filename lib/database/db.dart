import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'lista_compras.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  _createDB(Database db, version) async {
    await db.execute('''
    CREATE TABLE casa (
      id_depart INTEGER PRIMARY KEY AUTOINCREMENT,
      title_depart TEXT,
      color_depart TEXT,
      id_product INTEGER,
      title_product TEXT,
      description_product TEXT,
      price_product REAL
    );
''');
  }
}
