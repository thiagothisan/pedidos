import 'package:flutter/material.dart';
import 'package:pedidos/views/pedidos/pedido_form.dart';

class PedidosView extends StatefulWidget {
  const PedidosView({Key? key}) : super(key: key);

  @override
  _PedidosViewState createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
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
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white,
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                'N. Pedido: ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Cliente: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "THIAGO",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Data: ',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "29/06/2021",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          "Valor: ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "100.00",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pedido');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
