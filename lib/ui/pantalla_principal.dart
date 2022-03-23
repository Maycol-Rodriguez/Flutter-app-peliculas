import 'package:info_cinema/requests/api_request.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

// import 'package:info_cinema/widgets/widgets.dart';

class PantallaPrincipal extends StatelessWidget {

  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final getPeliculas = Provider.of<PeticionesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Series y Peliculas'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperWidget(peliculas: getPeliculas.resolucionNowPlaying),
            SliderWidget(titulo: 'Populares'          ,peliculas: getPeliculas.resolucionPopulares),
            SliderWidget(titulo: 'Proximos Estrenos'  ,peliculas: getPeliculas.resolucionUpcoming),
            SliderWidget(titulo: 'Mejores Calificados',peliculas: getPeliculas.resolucionTopRated),
          ],
        ),
      )
    );
  }
}