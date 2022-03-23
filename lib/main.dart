import 'package:flutter/material.dart';
import 'package:info_cinema/requests/api_request.dart';
import 'package:provider/provider.dart';

import 'ui/pantalla_detalles.dart';
import 'ui/pantalla_principal.dart';

void main() => runApp( const AppState() );

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PeticionesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'principal',
      routes: {
        'principal':( _ ) => const PantallaPrincipal(),
        'detalles':( _ ) => const PantallaDetalle(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo
        )
      ),
    );
  }
}