import 'package:caju/authservices.dart';
import 'package:caju/modelos/carrinho_manager.dart';
import 'package:caju/modelos/home_manager.dart';
import 'package:caju/modelos/login_controller';
import 'package:caju/modelos/product_manager.dart';
import 'package:caju/modelos/user.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:caju/telas/base/tela_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
      ), 
  );

  //FirebaseFirestore.instance.collection('teste213').add({'teste' : 'teste'});

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Authservices(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<Authservices, CarrinhoManager>(
          create: (_) => CarrinhoManager(),
          lazy: false,
          update: (_, authServices, carrinhoManager) =>
           carrinhoManager!..updateUsuario(authServices),
        ),
      ],
      child: MaterialApp(
        title: 'Caju Cafeteria',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 78, 35, 40),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xFFFFF6EC),
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 78, 35, 40),
            iconTheme: IconThemeData(color: Colors.white)
          ),
        ),
        home: Telabase(),
          ),
    );   
  }
}
