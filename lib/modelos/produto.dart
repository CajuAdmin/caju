import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {

Produto.fromDocument(DocumentSnapshot doc){
  id = doc.id;
  ativo = doc['ativo'] as bool;
  categoria = doc['categoria'] as String;
  descricao = doc['descricao'] as String;
  imagem = doc['imagem'] as String;
  preco = doc['preco'] as int;
  nome = doc['nome'] as String;

}

late String id;
late bool ativo;
late String categoria;
late String descricao;
late String imagem;
late int preco;
late String nome;


}