import 'package:caju/componentes/drawer_custom_header.dart';
import 'package:caju/componentes/drawer_tile.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color(0xFFC48C64),
                   Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: [
              DrawerCustomHeader(),
              const Divider(),
              Drawertile(iconData: Icons.home, title: 'Início', pagina: 0,),
              Drawertile(iconData: Icons.list, title: 'Categorias', pagina: 1),
              Drawertile(iconData: Icons.shopping_basket_rounded, title: 'Carrinho', pagina: 2,),
              Drawertile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos', pagina: 3,),
            ],
          ),
        ],
      ),
    );
  }
}
