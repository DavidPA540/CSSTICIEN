import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ticienapp/Pantallas/Solicitar_Registro.dart';
import 'Pantallas/Nueva_Contrasena.dart';
import 'Pantallas/Recuperar_Contrasena.dart';
import 'css.dart';
import 'Pantallas/Login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('es'), Locale('en')],
        locale: const Locale('es'),
        debugShowCheckedModeBanner: false,
        title: 'Nombramientos',
        color: AppTheme.primary,
        theme: ThemeData(),
        initialRoute: '/login',
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => const Login(),
          '/recuperar': (BuildContext context) => const Recuperar_Contrasena(),
          '/registrar': (BuildContext context) => const Solicitar_Registro(),
          '/nueva_Contra': (BuildContext context) => const Nueva_contrasena(),
        });
  }
}
