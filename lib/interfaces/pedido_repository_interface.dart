import 'package:pedidos/models/itens_pedido_model.dart';
import 'package:pedidos/models/pedido_model.dart';

abstract class IPedido {
  Future getPedido(int id);
  Future<List<Pedido>> getPedidos();
  Future insertPedido(Pedido model);
  Future insertItensPedido(ItensPedido model);
}
