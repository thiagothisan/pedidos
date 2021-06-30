import 'package:flutter/material.dart';
import 'package:pedidos/controllers/cliente_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cliente_form.dart';

class ClientesView extends StatefulWidget {
  const ClientesView({Key? key}) : super(key: key);

  @override
  _ClientesViewState createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
  final ClienteController _controller = ClienteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _controller.getClientes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                return Center(
                  child: Text('Ocorreu um erro'),
                );
              } else {
                return Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: _controller.listClientes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_controller.listClientes[index].nome),
                          trailing: Text(_controller
                              .listClientes[index].telefone
                              .toString()),
                        );
                      });
                });
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ClienteForm(
                  controller: _controller,
                );
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
