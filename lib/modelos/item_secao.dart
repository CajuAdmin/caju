class ItemSecao {

  ItemSecao.fromMap(Map<String, dynamic> mapa){
    imagem = mapa['imagem'] as String? ?? '';
    produto = mapa['produto'] as String? ?? '';
  }

  late String imagem;
  late String produto;

  @override
  String toString(){
    return 'ItemSecao{imagem: $imagem, produto: $produto}';
  }

}