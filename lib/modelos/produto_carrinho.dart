import 'package:caju/modelos/item_tamanho.dart';
import 'package:caju/modelos/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProdutoCarrinho extends ChangeNotifier {

  ProdutoCarrinho.fromProduto(this.produto){
    produtoid = produto.id;
    quantidade = 1;
    tamanho = produto.tamanhoSelecionado?.nome ?? 'P';
  }

  ProdutoCarrinho.fromDocument(DocumentSnapshot documento){
    id = documento.id;
    produtoid = documento.get('produtoid') as String;
    quantidade = documento.get('quantidade') as int;
    tamanho = documento.get('tamanho') as String;

    firestore.doc('produtos/$produtoid').get().then(
      (doc) {
        produto = Produto.fromDocument(doc);
        notifyListeners();
      }
    );
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late String id;

  late String produtoid;
  late int quantidade;
  late String tamanho;

  late Produto produto;

  ItemTamanho? get itemTamanho{
    return produto.findTamanho(tamanho);
  }

  num get precoUnitario {
    return itemTamanho?.preco ?? 0;
  }

  num get precoTotal => precoUnitario * quantidade;

  Map<String, dynamic> toCartItemMap(){
    return {
      'produtoid': produtoid,
      'quantidade': quantidade,
      'tamanho': tamanho,
    };
  }

  bool stackable(Produto produto){
    return produto.id == produtoid && produto.tamanhoSelecionado!.nome == tamanho; 
  }

  void increment(){
    quantidade++;
    notifyListeners();
  }

  void decrement(){
    quantidade--;
    notifyListeners();
  }

  bool get hasStock{
    final tamanho = itemTamanho;
    if (tamanho == null){
      return false;
    }
    return tamanho.estoque >= quantidade;
  }



}