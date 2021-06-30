import 'package:flutter/material.dart';

class PedidoForm extends StatefulWidget {
  const PedidoForm({Key? key}) : super(key: key);

  @override
  _PedidoFormState createState() => _PedidoFormState();
}

class _PedidoFormState extends State<PedidoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar pedido'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor',
              ),
            ),
            DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
