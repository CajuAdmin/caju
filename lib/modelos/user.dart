
// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usuario{

  Usuario({required this.email, required this.senha, required this.uid, required this.nome});

  late String email;
  late String senha;
  late String uid;
  late String nome;

  Future<String?> getDocumentIdByUid(String uid) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.id; 
    } else {
      return null; 
    }
  } catch (e) {
    print('Erro ao buscar o ID do documento: $e');
    return null;
  }
}

Future<DocumentReference?> get firestoreRef async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = auth.currentUser?.uid;
  if (uid != null) {
    final documentId = await getDocumentIdByUid(uid); 
      return firestore.collection('usuarios').doc(documentId); 
    }
    return null;
  }

Future<CollectionReference?> get carrinhoReference async {
  final documentRef = await firestoreRef;
  if (documentRef != null) {
    return documentRef.collection('carrinho'); 
  }
  return null; 
}

}



  