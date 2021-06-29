import 'package:pedidos/database/database_helper.dart';
import 'package:pedidos/interfaces/produto_repository_interface.dart';
import 'package:pedidos/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoRepository implements IProdutoRepository {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Produto>> getProdutos() async {
    try {
      Database db = await dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.query("produtos",
          where: "produtos.situacao = ?", whereArgs: ["ATIVO"]);
      if (maps.length > 0) {
        List<Produto> stuffList = maps.map((x) => Produto.fromMap(x)).toList();

        return stuffList;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future insertProduto(Produto model) async {
    try {
      Database db = await dbHelper.database;

      int id = await db.rawInsert(
          "INSERT INTO produtos (" +
              "nome," +
              "valor," +
              "situacao)" +
              "VALUES (?, ?,  ?)",
          [model.nome, model.valor, model.situacao]);

      return id;
    } catch (ex) {
      return null;
    }
  }
}
