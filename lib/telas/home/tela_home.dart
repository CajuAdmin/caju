import 'package:caju/componentes/drawer_custom.dart';
import 'package:caju/modelos/home_manager.dart';
import 'package:caju/telas/carrinho/tela_carrinho.dart';
import 'package:caju/telas/home/secao_list.dart';
import 'package:caju/telas/home/secao_staggered.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 228, 114, 69),
                  Color.fromARGB(255, 253, 181, 168)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Cafeteria CaJu',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  centerTitle: true,
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaCarrinho()),
                      );
                    }, 
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                  )
                ],
              ),
              Consumer<HomeManager>(
                builder: (_, homeManager, __){
                  final List<Widget> children = homeManager.secoes
                    .map<Widget>((secao) {
                      switch(secao.tipo){
                        case 'lista':
                          return SecaoList(secao: secao);
                        case 'staggered':
                          return SecaoStaggered(secao: secao);
                        default:
                          return Container();
                      }
                    }).toList();
                    children.add(SizedBox(height: 50));
                  return SliverList(
                delegate: SliverChildListDelegate(
                  children
                ),
              );
                }
              ),      
            ],
          ),
        ],
      ),
    );
  }
}