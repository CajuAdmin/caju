// ignore_for_file: unnecessary_null_comparison

import 'package:caju/authservices.dart';
import 'package:caju/modelos/produto.dart';
import 'package:caju/modelos/produto_carrinho.dart';
import 'package:caju/modelos/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CarrinhoManager extends ChangeNotifier{

  List<ProdutoCarrinho> items = [];

  late Usuario usuario;

  late num precoProdutos = 0.0;

  void updateUsuario(Authservices authServices){
    if (authServices.usuario != null){
      usuario = authServices.usuario!;
      items.clear();
      _loadCarrinhoItens();
    } else {
      items.clear();
    }
  }

  Future<void> _loadCarrinhoItens() async {
    final carrinhoRef = await usuario.carrinhoReference;
    if (carrinhoRef != null){
     final QuerySnapshot carrinhoSnap = await carrinhoRef.get();

     items = carrinhoSnap.docs.map((d) => ProdutoCarrinho.fromDocument(d)..addListener(_onItemUpdated)).toList();
    }
  }

  void addCarrinho(Produto produto) async{
    try {
      final e = items.firstWhere((p) => p.stackable(produto));
      e.increment();
    } catch (e) {
      final produtoCarrinho = ProdutoCarrinho.fromProduto(produto);
    produtoCarrinho.addListener(_onItemUpdated);
    items.add(produtoCarrinho);
    final carrinhoRef = await usuario.carrinhoReference;
      if (carrinhoRef != null) {
        await carrinhoRef.add(produtoCarrinho.toCartItemMap())
        .then((docRef) async {
          produtoCarrinho.id = docRef.id;
          _onItemUpdated();
        });
      }
    }
    notifyListeners();
  }

  void removeCarrinho(ProdutoCarrinho produtoCarrinho) async {
    items.removeWhere((p) => p.id == produtoCarrinho.id);
    final carrinhoRef = await usuario.carrinhoReference;
    if (carrinhoRef != null){
      await carrinhoRef.doc(produtoCarrinho.id).delete();
      produtoCarrinho.removeListener(_onItemUpdated);
      notifyListeners();
    }
  }

  void _onItemUpdated(){
    precoProdutos = 0.0;
    for(int i = 0; i<items.length; i++){
      final produtoCarrinho = items[i];

      if(produtoCarrinho.quantidade == 0){
        removeCarrinho(produtoCarrinho);
        i--;
        continue;
      }

      precoProdutos += produtoCarrinho.precoTotal;

      _uptadeProdutoCarrinho(produtoCarrinho);
    }

    notifyListeners();
  } 

  void _uptadeProdutoCarrinho(ProdutoCarrinho produtoCarrinho) async {
    final carrinhoRef = await usuario.carrinhoReference;
    if (carrinhoRef != null){
      await carrinhoRef.doc(produtoCarrinho.id)
      .update(produtoCarrinho.toCartItemMap());
    }
  }

  bool get isCarrinhoValid {
    for(final produtoCarrinho in items){
      if(!produtoCarrinho.hasStock){
        return false;
      }
    }
    return true;
  }

  Future<void> limparCarrinho() async {
  final carrinhoRef = await usuario.carrinhoReference;
  if (carrinhoRef == null) {
    return;
  }

  for (final produtoCarrinho in items) {
    await carrinhoRef.doc(produtoCarrinho.id).delete(); 
    produtoCarrinho.removeListener(_onItemUpdated); 
  }

  items.clear();
  precoProdutos = 0.0;

  notifyListeners();
}


}