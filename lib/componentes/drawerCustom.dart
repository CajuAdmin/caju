import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Icon(
                      Icons.home,
                      size: 32,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Início',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Icon(
                      Icons.category,
                      size: 32,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Categorias',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 32,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Meus Pedidos',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
