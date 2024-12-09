import 'package:caju/modelos/item_tamanho.dart';
import 'package:caju/modelos/produto.dart';

class ProdutoCarrinho {

  ProdutoCarrinho.fromProduto(this.produto){
    produtoid = produto.id;
    quantidade = 1;
    tamanho = produto.tamanhoSelecionado?.nome ?? 'P';
  }

  late String produtoid;
  late int quantidade;
  late String tamanho;

  Produto produto;

  ItemTamanho? get itemTamanho{
    return produto.findTamanho(tamanho);
  }

  num get precoUnitario {
    return itemTamanho?.preco ?? 0;
  }

}