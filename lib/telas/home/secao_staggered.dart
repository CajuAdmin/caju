import 'package:caju/modelos/secao.dart';
import 'package:caju/telas/home/item_tile.dart';
import 'package:caju/telas/home/secao_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SecaoStaggered extends StatelessWidget {
  const SecaoStaggered({required this.secao, super.key});

  final Secao secao;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SecaoHeader(secao: secao),
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: List.generate(secao.items.length, (index) {
              final isEven = index.isEven;
              return StaggeredGridTile.count(
                crossAxisCellCount: isEven ? 2 : 1, 
                mainAxisCellCount: isEven ? 2 : 3, 
                child: ItemTile(item: secao.items[index]),
              );
          })),
        ],
      ),
    );
  }
}