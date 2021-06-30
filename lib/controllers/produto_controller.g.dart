// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  final _$listProdutosAtom = Atom(name: '_ProdutoControllerBase.listProdutos');

  @override
  ObservableList<Produto> get listProdutos {
    _$listProdutosAtom.reportRead();
    return super.listProdutos;
  }

  @override
  set listProdutos(ObservableList<Produto> value) {
    _$listProdutosAtom.reportWrite(value, super.listProdutos, () {
      super.listProdutos = value;
    });
  }

  final _$getProdutosAsyncAction =
      AsyncAction('_ProdutoControllerBase.getProdutos');

  @override
  Future getProdutos() {
    return _$getProdutosAsyncAction.run(() => super.getProdutos());
  }

  @override
  String toString() {
    return '''
listProdutos: ${listProdutos}
    ''';
  }
}
