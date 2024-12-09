import 'package:caju/modelos/produto.dart';
import 'package:caju/modelos/produto_carrinho.dart';

class CarrinhoManager {

  List<ProdutoCarrinho> items = [];

  

  void addCarrinho(Produto produto){
    items.add(ProdutoCarrinho.fromProduto(produto));
  }

}