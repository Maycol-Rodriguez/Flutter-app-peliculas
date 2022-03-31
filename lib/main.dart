import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:info_cinema/requests/api_request.dart';
import 'package:info_cinema/temas/temas.dart';
import 'package:info_cinema/ui/screens.dart';

void main() => runApp( const AppState() );

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PeticionesProvider(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => SwitchTemas())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getTemaActual = Provider.of<SwitchTemas>(context).temaActual;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'principal',
      routes: {
        'principal':( _ ) => const PantallaPrincipal(),
        'detalles':( _ ) => const PantallaDetalle(),
      },
    
      theme: getTemaActual,
    );
  }
}