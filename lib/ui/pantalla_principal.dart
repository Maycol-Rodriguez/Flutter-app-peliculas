import 'package:info_cinema/busqueda/busqueda.dart';
import 'package:info_cinema/temas/temas.dart';
import 'package:provider/provider.dart';
import 'package:info_cinema/peticiones/api_request.dart';
import 'package:info_cinema/widgets/widgets.dart';

class PantallaPrincipal extends StatelessWidget {

  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getPeliculas = Provider.of<PeticionesProvider>(context);
    final getTemas = Provider.of<SwitchTemas>(context);

    return Scaffold(
      backgroundColor: getTemas.temaOscuro ? Colors.grey[900] : Colors.white,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: getTemas.temaOscuro ? const Color(0xFF006FA7) : Colors.indigo.shade600,
        title: const Text('Películas'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: BusquedaPeliculas())
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CardSwiperWidget(peliculas: getPeliculas.resolucionNowPlaying),
            SliderWidget(
              titulo: 'Populares',
              peliculas: getPeliculas.resolucionPopulares,
              siguientePeticion: () => getPeliculas.getPeliculasPopulares(),
            ),
            SliderWidget(
              titulo: 'Próximos Estrenos',
              peliculas: getPeliculas.resolucionUpcoming,
              siguientePeticion: () => getPeliculas.getPeliculasProximosEstrenos(),
            ),
            SliderWidget(
              titulo: 'Mejor Calificados',
              peliculas: getPeliculas.resolucionTopRated,
              siguientePeticion: () => getPeliculas.getPeliculasMejoresCalificadas(),
            ),
          ],
        ),
      )
    );
  }
}