class ItensPedido {
  int idPedido;
  int idProduto;
  int quantidadeProduto;
  ItensPedido({
    required this.idPedido,
    required this.idProduto,
    required this.quantidadeProduto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_pedido': idPedido,
      'id_produto': idProduto,
      'quantidade_produto': quantidadeProduto,
    };
  }

  factory ItensPedido.fromMap(Map<String, dynamic> map) {
    return ItensPedido(
      idPedido: map['id_pedido'],
      idProduto: map['id_produto'],
      quantidadeProduto: map['quantidade_produto'],
    );
  }
}
