import 'package:flutter/material.dart';
import 'package:pedidos/views/produtos/produto_form.dart';

class ProdutosView extends StatefulWidget {
  const ProdutosView({Key? key}) : super(key: key);

  @override
  _ProdutosViewState createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
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
                  return ListTile(
                    title: Text('Produto'),
                    trailing: Text('Valor'),
                  );
                });
          }
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ProdutoForm();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
