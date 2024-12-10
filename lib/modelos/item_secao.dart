class ItemSecao {


  ItemSecao.fromMap(Map<String, dynamic> mapa){
    imagem = mapa['imagem'] as String;
  }

  late String imagem;

}