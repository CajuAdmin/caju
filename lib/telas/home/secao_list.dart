import 'package:caju/modelos/secao.dart';
import 'package:caju/telas/home/secao_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecaoList extends StatelessWidget {
  const SecaoList({required this.secao, super.key});

  final Secao secao;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SecaoHeader(secao: secao),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(secao.items[index].imagem,
                  fit: BoxFit.cover,));
              }, 
              separatorBuilder: (_, __) => SizedBox(width: 4,), 
              itemCount: secao.items.length,
            ),
          )
        ],
      ),
    );
  }
}