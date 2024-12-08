import 'package:caju/authservices.dart';
import 'package:caju/telas/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerCustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<Authservices>(
        builder: (_, authServices, __){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Cafeteria CaJu',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Olá, bem vindx! ${authServices.nomeUsuario}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(authServices.isLoggedIn){
                    authServices.logout();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                child: Text(
                  authServices.isLoggedIn
                    ? 'Sair'
                    : 'Entre ou cadastre-se',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 54, 134, 44),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
