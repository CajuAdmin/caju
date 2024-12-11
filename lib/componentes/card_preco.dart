import 'package:caju/modelos/carrinho_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPreco extends StatelessWidget {
  const CardPreco({required this.textoBotao, required this.onPressed, super.key});

  final String textoBotao;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final carrinhoManager = context.watch<CarrinhoManager>();
    final precoProdutos = carrinhoManager.precoProdutos;

    return Card(
      margin: EdgeInsets.symmetric(horizontal:  15, vertical: 8),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resumo do Pedido',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('R\$ ${precoProdutos.toStringAsFixed(2)}')
              ],
            ),
            const Divider(),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'R\$ ${precoProdutos.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            SizedBox(height: 13,),
            ElevatedButton(
              onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 203, 117, 47),
                foregroundColor: Color.fromARGB(255, 204, 167, 141),
                minimumSize: Size(double.infinity, 45),
                ),
                  child: Text(
                    textoBotao,
                    style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    ),
                  ),
              ),
              SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}