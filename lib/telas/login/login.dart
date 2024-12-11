// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, body_might_complete_normally_nullable
import 'package:caju/authservices.dart';
import 'package:caju/modelos/login_controller';
import 'package:caju/telas/cadastrar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var txtEmail  = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();
  final LoginController _loginController = LoginController();
  final Authservices _authServices = Authservices();


  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _authServices.login(context, txtEmail.text, txtSenha.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Favor informar dados válidos!'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _EsqueceuSenhaDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Esqueceu a senha?"),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                  "Informe seu endereço de e-mail para receber instruções para redefinição de senha."
                ),
              SizedBox(height: 25),
              TextFormField(
                controller: txtEmailEsqueceuSenha,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(20),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _loginController.esqueceuSenha(
                  context,
                  txtEmailEsqueceuSenha.text
                );
              }, 
              child: Text('Enviar'),
            ),
          ],
        );
      }, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Color(0xFFfff6ec),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 280,
                height: 280,
                //child: Image.asset('assets/logo_borda_branca.png')
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: txtEmail,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Login: ',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFF8A2F38),
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail.';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: txtSenha,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Senha: ',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFF8A2F38),
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha.';
                  }
                  return null;
                },
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _EsqueceuSenhaDialog,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFC48C64),
                      Color(0xFF8A2F38),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: _validateForm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFC48C64),
                      Color(0xFF8A2F38),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastrar()),
                );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}