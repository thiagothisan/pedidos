import 'package:flutter/material.dart';

import 'package:pedidos/controllers/produto_controller.dart';
import 'package:pedidos/models/produto_model.dart';

class ProdutoForm extends StatefulWidget {
  final ProdutoController controller;
  const ProdutoForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _ProdutoFormState createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final Produto _produto = Produto(nome: '', valor: 0);

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
                  onSaved: (nome) => _produto.nome = nome.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                  ),
                  validator: (valor) {
                    if (valor!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (valor) =>
                      _produto.valor = double.parse(valor.toString()),
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
              await widget.controller.save(_produto);
              Navigator.pop(context);
            }
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
  }
}
