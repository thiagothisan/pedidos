import 'package:mobx/mobx.dart';
import 'package:pedidos/interfaces/cliente_repository_interface.dart';
import 'package:pedidos/models/cliente_model.dart';
import 'package:pedidos/repositories/cliente_repository.dart';
part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  IClienteRepository _clienteRepository = ClienteRepository();

  @observable
  ObservableList<Cliente> listClientes = ObservableList.of([]);

  @action
  getClientes() async {
    listClientes.clear();
    listClientes = ObservableList.of(await _clienteRepository.getClientes());
  }

  save(Cliente? model) async {
    model!.situacao = 'ATIVO';
    await _clienteRepository.insertCliente(model);
    await getClientes();
  }
}
