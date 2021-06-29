import 'package:pedidos/models/cliente_model.dart';

abstract class IClienteRepository {
  Future<List<Cliente>> getClientes();
  Future insertCliente(Cliente model);
}
