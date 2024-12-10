import 'package:caju/modelos/secao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecaoHeader extends StatelessWidget {
  const SecaoHeader({required this.secao, super.key});

  final Secao secao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 9),
      child: Text(
        secao.nome,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}