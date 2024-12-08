import 'package:caju/modelos/item_tamanho.dart';
import 'package:caju/modelos/produto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TamanhoWidget extends StatelessWidget {
  const TamanhoWidget({required this.tamanho, super.key});

  final ItemTamanho tamanho;

  @override
  Widget build(BuildContext context) {
    final produto = context.watch<Produto>();
    final selecionado = tamanho == produto.tamanhoSelecionado;

    Color color;
    if(!tamanho.hasEstoque){
      color = Colors.red;
    } else if(selecionado){
      color = Color.fromARGB(255, 78, 35, 40);
    } else {
      color = const Color.fromARGB(155, 0, 0, 0);
    }

    return GestureDetector(
      onTap: (){
        if(tamanho.hasEstoque){
          produto.tamanhoSelecionado = tamanho;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color,
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                tamanho.nome,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'R\$ ${tamanho.preco.toStringAsFixed(2)}'
              ),
            )
          ],
        ),
      ),
    );
  }
}