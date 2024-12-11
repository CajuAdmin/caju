import 'package:caju/modelos/item_secao.dart';
import 'package:caju/modelos/product_manager.dart';
import 'package:caju/telas/produtos/detalhe_produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({required this.item, super.key});

  final ItemSecao item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (item.produto.isNotEmpty){
          final produto = context.read<ProductManager>()
          .findProductById(item.produto);

          if (produto != null){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetalheProduto(produto: produto)),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Produto não encontrado!'))
            );
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage, 
          image: item.imagem,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}