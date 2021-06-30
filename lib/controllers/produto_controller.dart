import 'package:mobx/mobx.dart';
import 'package:pedidos/interfaces/produto_repository_interface.dart';
import 'package:pedidos/models/produto_model.dart';
import 'package:pedidos/repositories/produto_repository.dart';
part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  IProdutoRepository _produtoRepository = ProdutoRepository();

  @observable
  ObservableList<Produto> listProdutos = ObservableList.of([]);

  @action
  getProdutos() async {
    listProdutos.clear();
    listProdutos = ObservableList.of(await _produtoRepository.getProdutos());
    print("getProdutos: $listProdutos");
  }

  save(Produto? model) async {
    model!.situacao = 'ATIVO';
    print("save: $model");
    await _produtoRepository.insertProduto(model);
    await getProdutos();
  }
}
