import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_cinema/temas/temas.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getTemas = Provider.of<SwitchTemas>(context);

    return Drawer(
      backgroundColor: getTemas.temaOscuro ? Colors.black87 : Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 50),
            const ImagenUsuario(),
            const SizedBox(height: 70),
            const Opciones(opcion: 'Inicio',icono: Icons.home_filled),
            const Opciones(opcion: 'Cuenta',icono: FontAwesomeIcons.user),
            const Opciones(opcion: 'Opciones',icono: Icons.settings),
            const Opciones(opcion: 'Ayuda',icono: Icons.help_outlined),
            Expanded(child: Container()),
            const Licencia(),
            const SwitchOpcion(),
          ]
        ),
      )
    );
  }
}

class ImagenUsuario extends StatelessWidget {
  const ImagenUsuario({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getTemas = Provider.of<SwitchTemas>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: CircleAvatar(
        backgroundColor: getTemas.temaOscuro ? const Color(0xFF006FA7) : Colors.indigo,
        radius: 100,
        child: const Text('RM',style: TextStyle(fontSize: 50,color: Colors.white))
      ),
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

    final getTemas = Provider.of<SwitchTemas>(context);

    return Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child:ListTile(
        onTap: (){},
        leading: (getTemas.temaOscuro) 
                    ? FaIcon(icono, color: const Color(0xFF006FA7))
                    : FaIcon(icono, color: Colors.indigo),
        trailing: (getTemas.temaOscuro)
                    ? const Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Color(0xFF006FA7))
                    : const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.indigo),
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

    final getTemas = Provider.of<SwitchTemas>(context);

    return AboutListTile(
      child: const Text(
        'Licencias',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      applicationIcon: const Icon(Icons.flutter_dash),
      icon: (getTemas.temaOscuro)
                ? const Icon(Icons.source_outlined, color: Color(0xFF006FA7))
                : const Icon(Icons.source_outlined, color: Colors.indigo),
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
        leading: (getTemas.temaOscuro) 
                  ? const FaIcon(FontAwesomeIcons.moon, color: Color(0xFF006FA7))
                  : const FaIcon(FontAwesomeIcons.moon, color: Colors.indigo),
        trailing: Switch.adaptive(
          value: getTemas.temaOscuro,
          activeTrackColor: const Color(0xFF006FA7),
          onChanged: ( value ) => getTemas.temaOscuro = value,
          activeColor: const Color(0xFF006FA7)
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