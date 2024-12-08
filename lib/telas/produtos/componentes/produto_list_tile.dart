import 'package:caju/modelos/produto.dart';
import 'package:flutter/material.dart';

class ProdutoListTile extends StatelessWidget {
  const ProdutoListTile(this.produto, {super.key});

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                produto.imagem,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Icon(Icons.image_not_supported, size: 50,);
                },
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}'
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}