import 'package:pedidos/database/database_helper.dart';
import 'package:pedidos/interfaces/pedido_repository_interface.dart';
import 'package:pedidos/models/itens_pedido_model.dart';
import 'package:pedidos/models/pedido_model.dart';
import 'package:sqflite/sqflite.dart';

class PedidoRepository implements IPedido {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future getPedido(int id) async {
    try {
      Database db = await dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
          "SELECT " +
              "pedidos.id, " +
              "pedidos.data_hora_pedido," +
              "pedidos.total," +
              "clientes.nome," +
              "produtos.nome," +
              "produtos.valor" +
              "FROM pedidos," +
              "LEFT JOIN clientes" +
              "ON clientes.id = pedidos.id_cliente" +
              "LEFT JOIN itens_produto" +
              "ON itens_produto.id_pedido = pedidos.id" +
              "LEFT JOIN produtos" +
              "ON produtos.id = itens_produto.id_produto" +
              "WHERE pedidos.id = ?" +
              "ORDER BY pedidos.id",
          [id]);
      if (maps.length > 0) {
        return Pedido.fromMap(maps.first);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Pedido>> getPedidos() async {
    try {
      Database db = await dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.rawQuery(
          "SELECT " +
              "pedidos.id, " +
              "pedidos.data_hora_pedido," +
              "pedidos.total," +
              "clientes.nome" +
              "FROM pedidos" +
              "LEFT JOIN clientes" +
              "ON clientes.id = pedidos.id_cliente" +
              "ORDER BY pedidos.id",
          []);
      if (maps.length > 0) {
        List<Pedido> stuffList = maps.map((x) => Pedido.fromMap(x)).toList();

        return stuffList;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future insertPedido(Pedido model) async {
    try {
      Database db = await dbHelper.database;

      int id = await db.rawInsert(
          "INSERT INTO pedidos (" +
              "id_cliente," +
              "data_hora_pedido," +
              "total)" +
              "VALUES (?, ?, ?)",
          [model.idCliente, model.dataHoraPedido, model.total]);

      return id;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future insertItensPedido(ItensPedido model) async {
    try {
      Database db = await dbHelper.database;

      int id = await db.rawInsert(
          "INSERT INTO itens_pedido (" +
              "id_pedido," +
              "id_produto)" +
              "VALUES (?, ?)",
          [model.idPedido, model.idProduto]);

      return id;
    } catch (ex) {
      return null;
    }
  }
}
