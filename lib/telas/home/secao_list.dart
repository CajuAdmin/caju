import 'package:caju/modelos/secao.dart';
import 'package:caju/telas/home/item_tile.dart';
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
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index){
                return ItemTile(item: secao.items[index]);
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