import 'package:caju/modelos/produto_carrinho.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CarrinhoTile extends StatelessWidget {
  const CarrinhoTile({required this.produtoCarrinho, super.key});

  final ProdutoCarrinho produtoCarrinho;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                produtoCarrinho.produto.imagem,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Text(
                      produtoCarrinho.produto.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Tamanho: ${produtoCarrinho.tamanho}',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${produtoCarrinho.precoUnitario.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}