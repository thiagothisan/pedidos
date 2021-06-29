import 'package:pedidos/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<Produto>> getProdutos();
  Future insertProduto(Produto model);
}
