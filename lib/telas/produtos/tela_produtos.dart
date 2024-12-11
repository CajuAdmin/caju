import 'package:caju/componentes/drawer_custom.dart';
import 'package:caju/modelos/product_manager.dart';
import 'package:caju/telas/carrinho/tela_carrinho.dart';
import 'package:caju/telas/produtos/componentes/produto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaProdutos extends StatelessWidget {
  const TelaProdutos({this.filtroCategoria = '', super.key});

  final String filtroCategoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        title: Text('Produtos $filtroCategoria',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          final produtosFiltrados = productManager.allProducts
          .where((produto) => produto.categoria == filtroCategoria)
          .toList();

          if (produtosFiltrados.isEmpty) {
            return const Center(
              child: Text('Nenhum produto encontrado!'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: produtosFiltrados.length,
            itemBuilder: (_, index){
            return ProdutoListTile(produtosFiltrados[index]);
          }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaCarrinho()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}