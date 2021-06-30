import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pedidos/controllers/produto_controller.dart';
import 'package:pedidos/views/produtos/produto_form.dart';

class ProdutosView extends StatefulWidget {
  const ProdutosView({Key? key}) : super(key: key);

  @override
  _ProdutosViewState createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {
  final ProdutoController _controller = ProdutoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _controller.getProdutos(),
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
                      itemCount: _controller.listProdutos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_controller.listProdutos[index].nome),
                          trailing: Text(
                              _controller.listProdutos[index].valor.toString()),
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
                return ProdutoForm(
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
