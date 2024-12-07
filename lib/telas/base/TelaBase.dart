import 'package:caju/componentes/drawerCustom.dart';
import 'package:flutter/material.dart';

class Telabase extends StatelessWidget {
const Telabase({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          drawer: DrawerCustom(),
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Container(color: Colors.red),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}