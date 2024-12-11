import 'package:caju/componentes/card_preco.dart';
import 'package:caju/componentes/drawer_custom.dart';
import 'package:caju/modelos/carrinho_manager.dart';
import 'package:caju/telas/carrinho/carrinho_tile.dart';
import 'package:caju/telas/produtos/tela_categorias.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCarrinho extends StatelessWidget {
  const TelaCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(
              context,
            MaterialPageRoute(builder: (context) => TelaCategorias()),
            );
          }, 
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer<CarrinhoManager>(
        builder: (_, carrinhoManager, __){
          return ListView(
            children: [
              Column(
                children: carrinhoManager.items.map(
                (produtoCarrinho) => CarrinhoTile(produtoCarrinho: produtoCarrinho)
                ).toList(),
              ),
              CardPreco(
                textoBotao: 'Finalizar compra',
                onPressed: (){},
              ),
            ],
          );
        }
      ),
    );
  }
}