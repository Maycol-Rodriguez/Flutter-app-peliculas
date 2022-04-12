import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:info_cinema/model/model.dart';
import 'package:info_cinema/peticiones/api_request.dart';

class PantallaDetalle extends StatelessWidget {

  const PantallaDetalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Peliculas pelicula = ModalRoute.of(context)!.settings.arguments as Peliculas;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Caratula(peliculas: pelicula),
              PeliculaDetalles(peliculas: pelicula),
              ListadoActores(peliculaId: pelicula.id),

            ],
          ),
        ),
      )
    );
  }
}


//! Pelicula - Caratula
class Caratula extends StatelessWidget {
  
  final Peliculas peliculas;

  const Caratula({
    Key? key,
    required this.peliculas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.75,
          child: Hero(
            tag: peliculas.heroId!,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              ),
              child: FadeInImage(
                image: NetworkImage(peliculas.getImgPosterPath),
                placeholder: const AssetImage('assets/no-image.jpg'), 
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        
        IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back,size: 40)
        ),
      ],
    );
  }
}


//! Pelicula - Detalles(Overview)
class PeliculaDetalles extends StatelessWidget {

  final Peliculas peliculas;

  const PeliculaDetalles({
    Key? key,
    required this.peliculas,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(peliculas.originalTitle,style: const TextStyle(fontSize: 18)),
              Text(peliculas.title,style: const TextStyle(fontSize: 24,)),
              Row(
                children: [
                  const Icon(Icons.star_border, size: 26,color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    '${peliculas.voteAverage} - ${peliculas.releaseDate}', 
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    )
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sinopsis',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              Text(peliculas.overview, textAlign: TextAlign.justify,style: const TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ],
    );
  }
}


//! Pelicula - Actores
class ListadoActores extends StatelessWidget {

  final int peliculaId;

  const ListadoActores({
    Key? key, 
    required this.peliculaId,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final getPeliculas = Provider.of<PeticionesProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Actores',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        
        FutureBuilder(
          future: getPeliculas.getCreditosActores(peliculaId),
          builder: ( _ , AsyncSnapshot<List<Casting>> snapshot) {

            if ( !snapshot.hasData ){

              return Container(
                constraints: const BoxConstraints(maxWidth: 150),
                height: 180,
                child: const CupertinoActivityIndicator(),
              );

            }

            final List<Casting> casting = snapshot.data!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 340,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: casting.length,
                    itemBuilder: ( _ , int index) {
                      return CastingImagen(actor: casting[index]);
                    }
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}

class CastingImagen extends StatelessWidget {

  final Casting actor;

  const CastingImagen({
    Key? key, 
    required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 180,
      height: 250,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              image: NetworkImage(actor.getImgProfilePath),
              placeholder: const AssetImage('assets/no-image.jpg'), 
              width: 180,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            actor.name,
            style: const TextStyle(
              fontSize: 18
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}