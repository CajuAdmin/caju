import 'package:caju/modelos/secao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeManager {

  HomeManager(){
    _loadSecoes();
  }

  List<Secao> secoes = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadSecoes() async {
    firestore.collection('home').snapshots().listen((snapshot){
      for(final DocumentSnapshot document in snapshot.docs){
        secoes.add(Secao.fromDocument(document));
      }
    });
  }

}