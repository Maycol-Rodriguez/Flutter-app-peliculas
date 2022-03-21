import 'package:flutter/material.dart';

import 'ui/pantalla_detalles.dart';
import 'ui/pantalla_principal.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'principal',
      routes: {
        'principal':(context) => const PantallaPrincipal(),
        'detalles':(context) => const PantallaDetalle(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo
        )
      ),
    );
  }
}