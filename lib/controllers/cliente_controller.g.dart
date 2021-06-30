// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteController on _ClienteControllerBase, Store {
  final _$listClientesAtom = Atom(name: '_ClienteControllerBase.listClientes');

  @override
  ObservableList<Cliente> get listClientes {
    _$listClientesAtom.reportRead();
    return super.listClientes;
  }

  @override
  set listClientes(ObservableList<Cliente> value) {
    _$listClientesAtom.reportWrite(value, super.listClientes, () {
      super.listClientes = value;
    });
  }

  final _$getClientesAsyncAction =
      AsyncAction('_ClienteControllerBase.getClientes');

  @override
  Future getClientes() {
    return _$getClientesAsyncAction.run(() => super.getClientes());
  }

  @override
  String toString() {
    return '''
listClientes: ${listClientes}
    ''';
  }
}
