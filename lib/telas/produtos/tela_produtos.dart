import 'package:caju/componentes/drawer_custom.dart';
import 'package:caju/modelos/product_manager.dart';
import 'package:caju/telas/produtos/componentes/produto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaProdutos extends StatelessWidget {
  const TelaProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        title: const Text('Produtos', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: productManager.allProducts.length,
            itemBuilder: (_, index){
            return ProdutoListTile(productManager.allProducts[index]);
          }
          );
        }
      ),
    );
  }
}