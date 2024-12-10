import 'package:cloud_firestore/cloud_firestore.dart';

class Secao {

  Secao.fromDocument(DocumentSnapshot document){
    nome = document.get('nome') as String;
    tipo = document.get('tipo') as String;
  }

  late String nome;
  late String tipo;

}