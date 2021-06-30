import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pedidos/controllers/cliente_controller.dart';
import 'package:pedidos/models/cliente_model.dart';

class ClienteForm extends StatefulWidget {
  final ClienteController controller;
  const ClienteForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _ClienteFormState createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();

  final Cliente cliente = Cliente(nome: '', dataNascimento: '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Adicionar Produto"),
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
                  controller: telefoneController,
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
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
                  onSaved: (telefone) => cliente.telefone = telefone.toString(),
                  onEditingComplete: () =>
                      getFormattedPhoneNumber(telefoneController.text),
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
                      _selectDate(context).then(
                          (value) => dataNascimentoController.text = value);
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
              await widget.controller.save(cliente);
              Navigator.pop(context);
            }
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
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

  String getFormattedPhoneNumber(String _phoneNumber) {
    print("getFormattedPhoneNumber: $_phoneNumber");
    if (_phoneNumber.isEmpty) {
      return "";
    }

    String phoneNumber = _phoneNumber;

    bool addParents = phoneNumber.length >= 2;
    bool addDash = phoneNumber.length >= 10 || phoneNumber.length == 8;

    String updatedNumber = "";

    if (addParents) {
      updatedNumber += "(";
      updatedNumber += phoneNumber.substring(0, 2);
      updatedNumber += ")";
    } else {
      updatedNumber += phoneNumber.substring(0);
      return updatedNumber;
    }

    if (addDash) {
      updatedNumber += phoneNumber.substring(2, 7);
      updatedNumber += "-";
    } else {
      updatedNumber += phoneNumber.substring(2);
      return updatedNumber;
    }

    updatedNumber += phoneNumber.substring(7);
    telefoneController.text = updatedNumber;
    return updatedNumber;
  }
}
