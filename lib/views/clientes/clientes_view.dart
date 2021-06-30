import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedidos/controllers/cliente_controller.dart';
import 'package:pedidos/models/cliente_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ClientesView extends StatefulWidget {
  const ClientesView({Key? key}) : super(key: key);

  @override
  _ClientesViewState createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final ClienteController _controller = ClienteController();

  final Cliente cliente = Cliente(nome: '', dataNascimento: '');

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
          _showDialog();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar cliente"),
            content: Form(
                key: formKey,
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Nome'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (nome) {
                          if (nome!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (nome) => cliente.nome = nome.toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefone',
                        ),
                        validator: (telefone) {
                          if (telefone!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (telefone) =>
                            cliente.telefone = telefone.toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: dataNascimentoController,
                        textCapitalization: TextCapitalization.characters,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Data de Nascimento'),
                        onTap: () {
                          setState(() {
                            _selectDate(context).then((value) =>
                                dataNascimentoController.text = value);
                          });
                        },
                        validator: (nacimento) {
                          if (nacimento!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (nascimento) =>
                            cliente.dataNascimento = nascimento.toString(),
                      ),
                    ],
                  ),
                )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar')),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    await _controller.save(cliente);
                    Navigator.pop(context);
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          );
        });
  }

  Future<String> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year, today.month, 31),
    );

    String formattedDate =
        formatter.format(DateTime.parse(selectedDate.toString()));
    return formattedDate;
  }
}
