import 'package:caju/modelos/item_tamanho.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Produto extends ChangeNotifier{

Produto.fromDocument(DocumentSnapshot doc){
  id = doc.id;
  final data = doc.data() as Map<String, dynamic>;
  ativo = doc['ativo'] as bool;
  categoria = doc['categoria'] as String;
  descricao = doc['descricao'] as String;
  imagem = doc['imagem'] as String;
  nome = doc['nome'] as String;
  tamanhos = (data['tamanhos'] as List<dynamic>).map(
    (t) => ItemTamanho.fromMap(t as Map<String, dynamic>)).toList();
}

late String id;
late bool ativo;
late String categoria;
late String descricao;
late String imagem;
late String nome;
late List<ItemTamanho> tamanhos;

ItemTamanho? _tamanhoSelecionado;
ItemTamanho? get tamanhoSelecionado => _tamanhoSelecionado;
set tamanhoSelecionado(ItemTamanho? value){
  _tamanhoSelecionado = value;
  notifyListeners();
}

ItemTamanho? findTamanho(String nome){
  return tamanhos.firstWhere((t) => t.nome == nome);
}

}