class ItemTamanho {

  ItemTamanho.fromMap(Map<String, dynamic> map){
    nome = map['nome'] as String;
    preco = map['preco'] as num;
    estoque = map['estoque'] as int;
  }

  late String nome;
  late num preco;
  late int estoque;

  bool get hasEstoque => estoque > 0;

  @override
  String toString(){
    return 'ItemTamanho{nome: $nome, preco: $preco, estoque: $estoque}';
  }

}