// ignore_for_file: unused_import

import 'package:caju/modelos/item_tamanho.dart';
import 'package:caju/modelos/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductManager extends ChangeNotifier {

  ProductManager(){
    _loadAllProducts();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Produto> allProducts = [];

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
     await firestore.collection('produtos').get();

     allProducts = snapProducts.docs.map(
      (d) => Produto.fromDocument(d)).toList();

    notifyListeners();

  }

  Produto? findProductById(String id){
      return allProducts.firstWhere((p) => p.id == id);
  }


}