import 'package:info_cinema/model/model.dart';
import 'package:info_cinema/peticiones/api_request.dart';
import 'package:info_cinema/temas/temas.dart';
import 'package:provider/provider.dart';

class BusquedaPeliculas extends SearchDelegate {

  @override
  String? get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final getPeliculas = Provider.of<PeticionesProvider>(context, listen: false);

    if ( query.isEmpty ) {
      return const _ContainerVacio();
    }
    return FutureBuilder(
      future: getPeliculas.getBuscarPeliculas(query),
      builder: ( _ , AsyncSnapshot<List<Peliculas>> snapshot) {

        if( !snapshot.hasData ){
          return const _ContainerVacio(); 
        }

        final pelicula = snapshot.data!;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: pelicula.length,
          itemBuilder: ( _ , int index) => _MostrarBusqueda(pelicula: pelicula[index])
        );
      }
    );
  }
}

class _ContainerVacio extends StatelessWidget {

  const _ContainerVacio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.group_work_sharp, size: 120),
    );
  }
}

class _MostrarBusqueda extends StatelessWidget {

  final Peliculas pelicula;

  const _MostrarBusqueda({Key? key, required this.pelicula} ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getTema = Provider.of<SwitchTemas>(context);
    pelicula.heroId = 'busqueda-${pelicula.id}';

    return GestureDetector(
      onTap: () => Navigator.pushNamed( context , 'detalles',arguments: pelicula),
      child: Hero(
        tag: pelicula.heroId!,
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: getTema.temaOscuro ? Colors.white : Colors.black,
            )
          ),  
          child: Row(
            children: [
              SizedBox(
                height: 250,
                width: 170,
                child: GestureDetector(
                  onTap:() => Navigator.pushNamed(context, 'detalles',arguments: pelicula),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(19),
                    ),
                    child: FadeInImage(
                      image: NetworkImage(pelicula.getImgPosterPath),
                      placeholder: const AssetImage('assets/no-image.jpg'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DetallesWidget(pelicula.originalTitle, altura: 18),
                    const SizedBox(height: 10),
                    DetallesWidget(pelicula.title, altura: 16),
                    const SizedBox(height: 12),
                    _PopularidadWidget(pelicula),
                    const SizedBox(height: 12),
                    Text('Estreno:  ${pelicula.releaseDate!}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetallesWidget extends StatelessWidget {
  final double altura;
  final String pelicula;
  const DetallesWidget(
    this.pelicula,
    { Key? key, required this.altura}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          pelicula, 
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: altura),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _PopularidadWidget extends StatelessWidget {
  final Peliculas pelicula;
  const _PopularidadWidget(this.pelicula, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_outline_rounded),
          const SizedBox(width: 10),
          Text(
            '${pelicula.voteAverage}', 
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          
        ],
      ),
    );
  }
}