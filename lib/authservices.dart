// ignore_for_file: unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:caju/telas/base/tela_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authservices extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _nomeUsuario;
  bool get isLoggedIn => auth.currentUser != null;

  Authservices() {
    _initializeUser();
    notifyListeners();
  }

  Future<void> _initializeUser() async {
    if (isLoggedIn) {
      final snapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: user!.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        _nomeUsuario = snapshot.docs.first.data()['nome'];
      }
    } else {
      _nomeUsuario = null;
    }

    notifyListeners();
  }


  // Getter para o nome do usuário logado
  String get nomeUsuario => _nomeUsuario ?? '';

  // Getter para o usuário atual
  User? get user => auth.currentUser;

  // Método para logout
  void logout() {
    auth.signOut();
    _nomeUsuario = null;
    notifyListeners();
  }

  void login(context, email, senha){
    auth.signInWithEmailAndPassword(
      email: email, password: senha
    ).then((value){
      _initializeUser();
      notifyListeners();
      sucesso(context, 'Usuário autenticado com sucesso.');
      //Navigator.pushReplacementNamed(context, 'cardapio');
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Telabase()), // Pode ser sua tela base, ou a próxima tela que você deseja
    );

    }).catchError((e){
      switch (e.code){
        case 'invalid-email':
          erro(context, 'O formato do e-mail é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

   void sucesso(context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

  void erro(context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
}


