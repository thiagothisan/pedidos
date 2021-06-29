class Cliente {
  int? id;
  String nome;
  String dataNascimento;
  String? telefone;
  String? situacao;
  Cliente({
    this.id,
    required this.nome,
    required this.dataNascimento,
    this.telefone,
    this.situacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'data_nascimento': dataNascimento,
      'telefone': telefone,
      'situacao': situacao,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      dataNascimento: map['data_nascimento'],
      telefone: map['telefone'],
      situacao: map['situacao'],
    );
  }
}
