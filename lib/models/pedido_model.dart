import 'itens_pedido_model.dart';

class Pedido {
  int? id;
  int idCliente;
  String? dataHoraPedido;
  num? total;
  List<ItensPedido> itensPedido;
  Pedido({
    this.id,
    required this.idCliente,
    this.dataHoraPedido,
    this.total,
    required this.itensPedido,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_cliente': idCliente,
      'data_hora_pedido': dataHoraPedido,
      'total': total,
      'itens_pedido': itensPedido.map((x) => x.toMap()).toList(),
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      idCliente: map['id_cliente'],
      dataHoraPedido: map['data_hora_pedido'],
      total: map['total'],
      itensPedido: List<ItensPedido>.from(
          map['itens_pedido']?.map((x) => ItensPedido.fromMap(x))),
    );
  }
}
