import 'package:caju/modelos/carrinho_manager.dart';
import 'package:caju/telas/carrinho/carrinho_tile.dart';
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
      ),
      body: Consumer<CarrinhoManager>(
        builder: (_, carrinhoManager, __){
          return Column(
            children: carrinhoManager.items.map(
              (produtoCarrinho) => CarrinhoTile(produtoCarrinho: produtoCarrinho)
              ).toList(),
          );
        }
      ),
    );
  }
}