import 'package:caju/componentes/drawer_custom.dart';
import 'package:caju/modelos/page_manager.dart';
import 'package:caju/telas/carrinho/tela_carrinho.dart';
import 'package:caju/telas/home/tela_home.dart';
import 'package:caju/telas/login/login.dart';
import 'package:caju/telas/produtos/tela_categorias.dart';
import 'package:caju/telas/produtos/tela_produtos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Telabase extends StatelessWidget {
Telabase({super.key});

final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        children: <Widget>[
          TelaHome(),
          TelaCategorias(),
          TelaCarrinho(),
        ],
      ),
    );
  }
}