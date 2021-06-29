import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "pedidos.db";
  static final _databaseVersion = 1;

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // tem somente uma referência ao banco de dados

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  // abre o banco de dados e o cria se ele não existir
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE clientes (" +
        "id INTEGER PRIMARY KEY," +
        "nome TEXT," +
        "data_nascimento TEXT," +
        "telefone TEXT," +
        "situacao TEXT)");

    await db.execute("CREATE TABLE itens_pedido (" +
        "id_pedido INTEGER," +
        "id_produto INTEGER)");

    await db.execute("CREATE TABLE pedidos (" +
        "id INTEGER PRIMARY KEY," +
        "id_cliente INTEGER," +
        "data_hora_pedido TEXT," +
        "total REAL)");

    await db.execute("CREATE TABLE produtos (" +
        "id INTEGER PRIMARY KEY," +
        "nome TEXT," +
        "valor REAL," +
        "situacao TEXT)");
  }
}
