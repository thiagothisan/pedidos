import 'package:pedidos/database/database_helper.dart';
import 'package:pedidos/interfaces/cliente_repository_interface.dart';
import 'package:pedidos/models/cliente_model.dart';
import 'package:sqflite/sqflite.dart';

class ClienteRepository implements IClienteRepository {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Cliente>> getClientes() async {
    try {
      Database db = await dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.query("clientes",
          where: "clientes.situacao = ?", whereArgs: ["ATIVO"]);
      if (maps.length > 0) {
        List<Cliente> stuffList = maps.map((x) => Cliente.fromMap(x)).toList();

        return stuffList;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future insertCliente(Cliente model) async {
    try {
      Database db = await dbHelper.database;

      int id = await db.rawInsert(
          "INSERT INTO clientes (" +
              "nome," +
              "data_nascimento," +
              "telefone," +
              "situacao)" +
              "VALUES (?, ?, ?, ?)",
          [model.nome, model.dataNascimento, model.telefone, model.situacao]);

      return id;
    } catch (ex) {
      return null;
    }
  }
}
