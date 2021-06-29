import 'package:flutter/material.dart';

class ClienteForm extends StatelessWidget {
  const ClienteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Container(
      width: double.maxFinite,
      height: 250,
      margin: EdgeInsets.all(15.0),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: 'Nome'),
          ),
          TextFormField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: 'Telefone'),
          ),
          TextFormField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: 'Data de Nascimento'),
          ),
        ],
      )),
    );
  }
}
