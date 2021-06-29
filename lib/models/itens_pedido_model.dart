class ItensPedido {
  int idPedido;
  int idProduto;
  ItensPedido({
    required this.idPedido,
    required this.idProduto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_pedido': idPedido,
      'id_produto': idProduto,
    };
  }

  factory ItensPedido.fromMap(Map<String, dynamic> map) {
    return ItensPedido(
      idPedido: map['id_pedido'],
      idProduto: map['id_produto'],
    );
  }
}
