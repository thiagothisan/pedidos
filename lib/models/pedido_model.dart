class Pedido {
  int? id;
  int idCliente;
  String? dataHoraPedido;
  num? total;

  Pedido({
    this.id,
    required this.idCliente,
    this.dataHoraPedido,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_cliente': idCliente,
      'data_hora_pedido': dataHoraPedido,
      'total': total,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      idCliente: map['id_cliente'],
      dataHoraPedido: map['data_hora_pedido'],
      total: map['total'],
    );
  }
}
