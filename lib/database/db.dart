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
    await db.execute('''CREATE TABLE Item (
        Id_Item INTEGER PRIMARY KEY,
        Name_Item TEXT,
        Description_Item TEXT
        );''');

    await db.execute('''CREATE TABLE Department (
        Id_Depart INTEGER PRIMARY KEY,
        Name_Depart TEXT
        );''');

    await db.execute('''CREATE TABLE Date_Price (
    Id_Date_Price INTEGER PRIMARY KEY,
    Date DATETIME,
    Price REAL,
    Id_Item INTEGER,
    FOREIGN KEY(Id_Item) REFERENCES Item (Id_Item)
    );''');

    await db.execute('''CREATE TABLE List (
    Id_List INTEGER PRIMARY KEY,
    Id_Depart INTEGER,
    Id_Item INTEGER,
    FOREIGN KEY(Id_Depart) REFERENCES Department(Id_Depart),
    FOREIGN KEY(Id_Item) REFERENCES Item (Id_Item)
    );''');
  }
}
