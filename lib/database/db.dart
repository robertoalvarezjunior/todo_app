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
    await db.execute('''CREATE TABLE item (
        idItem INTEGER PRIMARY KEY AUTOINCREMENT,
        nameItem TEXT,
        descriptionItem TEXT
        );''');

    await db.execute('''CREATE TABLE department (
        idDepart INTEGER PRIMARY KEY AUTOINCREMENT,
        nameDepart TEXT,
        colorDepart TEXT
        );''');

    await db.execute('''CREATE TABLE datePrice (
    idDatePrice INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME,
    price REAL,
    idItem INTEGER,
    FOREIGN KEY(idItem) REFERENCES item (idItem)
    );''');

    await db.execute('''CREATE TABLE list (
    idList INTEGER PRIMARY KEY AUTOINCREMENT,
    idDepart INTEGER,
    idItem INTEGER,
    FOREIGN KEY(idDepart) REFERENCES department (idDepart),
    FOREIGN KEY(idItem) REFERENCES item (idItem)
    );''');
  }
}
