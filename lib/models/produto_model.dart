class Produto {
  int? id;
  String nome;
  num valor;
  String? situacao;
  Produto({
    this.id,
    required this.nome,
    required this.valor,
    this.situacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'valor': valor,
      'situacao': situacao,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      valor: map['valor'],
      situacao: map['situacao'],
    );
  }
}
