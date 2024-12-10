import 'package:caju/modelos/item_secao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Secao {

  Secao.fromDocument(DocumentSnapshot document){
    nome = document.get('nome') as String;
    tipo = document.get('tipo') as String;
    items = (document.get('items') as List).map(
      (e) => ItemSecao.fromMap(e as Map<String, dynamic>)).toList();
  }

  late String nome;
  late String tipo;
  late List<ItemSecao> items;

}