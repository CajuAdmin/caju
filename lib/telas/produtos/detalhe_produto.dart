// ignore_for_file: sized_box_for_whitespace

import 'package:caju/authservices.dart';
import 'package:caju/modelos/carrinho_manager.dart';
import 'package:caju/modelos/produto.dart';
import 'package:caju/telas/carrinho/tela_carrinho.dart';
import 'package:caju/telas/login/login.dart';
import 'package:caju/telas/produtos/componentes/tamanho_widget.dart';
import 'package:caju/telas/produtos/tela_produtos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalheProduto extends StatelessWidget {
  const DetalheProduto({required this.produto, super.key});

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: produto,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            produto.nome,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          centerTitle: true,
          leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back),
        ),
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                produto.imagem,
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  Text(
                    'R\$',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 78, 35, 40)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      produto.descricao,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Tamanhos ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: produto.tamanhos.map((t){
                      return TamanhoWidget(tamanho: t);
                    }).toList(),
                  ),
                  SizedBox(height: 20,),
                  Consumer2<Authservices, Produto>(
                    builder: (_, authServices, produto, __){
                      return ElevatedButton(
                        onPressed: produto.tamanhoSelecionado != null ? () {
                          if (authServices.isLoggedIn){
                            
                            context.read<CarrinhoManager>().addCarrinho(produto);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TelaCarrinho()),
                            );

                          } else {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }
                        } : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 203, 117, 47),
                          foregroundColor: Color.fromARGB(255, 204, 167, 141),
                          minimumSize: Size(double.infinity, 60),
                        ),
                        child: Text(
                          authServices.isLoggedIn
                          ? 'Adicionar ao Carrinho'
                          : 'Entre para Comprar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}