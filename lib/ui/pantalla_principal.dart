import 'package:provider/provider.dart';
import 'package:info_cinema/requests/api_request.dart';
import 'package:info_cinema/widgets/widgets.dart';

class PantallaPrincipal extends StatelessWidget {

  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getPeliculas = Provider.of<PeticionesProvider>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Películas'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperWidget(peliculas: getPeliculas.resolucionNowPlaying),
            SliderWidget(
              titulo: 'Populares'          ,
              peliculas: getPeliculas.resolucionPopulares,
              siguientePeticion: () => getPeliculas.getPeliculasPopulares(),
            ),
            SliderWidget(
              titulo: 'Próximos Estrenos'  ,
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
