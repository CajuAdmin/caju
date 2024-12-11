// ignore_for_file: unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:caju/telas/base/tela_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:caju/modelos/user.dart';
import 'package:provider/provider.dart';

class Authservices extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _nomeUsuario;
  bool get isLoggedIn => auth.currentUser != null;

  Usuario? usuarioAtual;

  Authservices() {
    _initializeUser();
    notifyListeners();
  }

  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  void setUsuario(Usuario usuario){
    _usuario = usuario;
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


  String get nomeUsuario => _nomeUsuario ?? '';

  User? get user => auth.currentUser;

  void logout() {
    auth.signOut();
    _nomeUsuario = null;
    usuarioAtual = null;
    notifyListeners();
  }

  void login(BuildContext context, String email, String senha) {
    auth.signInWithEmailAndPassword(email: email, password: senha).then(
      (value) async {

        _initializeUser();

        String uid = auth.currentUser!.uid;

        String nome = '';

        QuerySnapshot querySnapshot = await firestore
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get();

        if (querySnapshot.docs.isNotEmpty) {
           DocumentSnapshot userDoc = querySnapshot.docs.first; 
           nome = userDoc.get('nome'); 
        } 


      Usuario usuario = Usuario(
        uid: uid,
        email: email,
        senha: senha,
        nome: nome,
      );
      
      Provider.of<Authservices>(context, listen: false).setUsuario(usuario);

      notifyListeners();
      sucesso(context, 'Usuário autenticado com sucesso.');

      Navigator.of(context).pop();
      
    }).catchError((e) {
      switch (e.code) {
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

void criarConta(context, nome, email, senha){
    auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((value){
      FirebaseFirestore.instance.collection('usuarios')
      .add(
        {
          'uid': value.user!.uid,
          'nome': nome
        }
      );
      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e){
      switch (e.code){
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  void esqueceuSenha(context, String email){
    if(email.isNotEmpty){
      auth.sendPasswordResetEmail(email: email);
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar a conta.');
    }
    Navigator.pop(context);
  }

  
  idUsuario(){
    return auth.currentUser!.uid;
  }

  Future<String>usuarioLogado() async {
    var nome = "";
    await FirebaseFirestore.instance  
      .collection('usuarios')
      .where('uid', isEqualTo: idUsuario())
      .get()
      .then((value){
        nome = value.docs[0].data()['nome'] ?? '';
      });
    return nome;
  } 
}


