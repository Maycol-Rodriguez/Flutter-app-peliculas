import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_cinema/temas/temas.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const [
              SizedBox(height: 50),
              ImagenUsuario(),
              SizedBox(height: 50),
              Opciones(opcion: 'Inicio',icono: Icons.home_filled),
              Opciones(opcion: 'Opciones',icono: Icons.settings),
              Opciones(opcion: 'Cuenta',icono: FontAwesomeIcons.user),
              Licencia(),
              SwitchOpcion(),
            ]
          ),
        )
      ),
    );
  }
}

class ImagenUsuario extends StatelessWidget {
  const ImagenUsuario({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 100,
      child: Text('RM',style: TextStyle(fontSize: 50,color: Colors.white))
    );
  }
}


class Opciones extends StatelessWidget {
  
  final String opcion;
  final IconData icono;

  const Opciones({
    required this.opcion,
    required this.icono,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child:ListTile(
        onTap: (){},
        leading: FaIcon(icono),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 15,),
        title: Text(
          opcion,
          style: const TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold
          )
        )
      ),
    );
  }
}


class Licencia extends StatelessWidget {
  const Licencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AboutListTile(
      child: Text(
        'Licencias',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      applicationIcon: Icon(Icons.flutter_dash),
      icon: Icon(Icons.source_outlined),
      applicationVersion: 'Version: 1.0.0',
      applicationName: 'Flutter películas',
    );
  }
}


class SwitchOpcion extends StatelessWidget {
  
  const SwitchOpcion({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getTemas = Provider.of<SwitchTemas>(context);

    return Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child:ListTile(
        leading: const FaIcon(FontAwesomeIcons.moon),
        trailing: Switch.adaptive(
          value: getTemas.temaOscuro, 
          onChanged: ( value ) => getTemas.temaOscuro = value,
          activeColor: Colors.blue,
        ),
        title: const Text(
          'Modo oscuro',
          style: TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold
          )
        )
      ),
    );
  }
}