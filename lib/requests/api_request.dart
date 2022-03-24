import 'package:http/http.dart' as http;
import 'package:info_cinema/model/map_respuesta_creditos.dart';
import 'package:info_cinema/model/model.dart';

class PeticionesProvider extends ChangeNotifier{

  final _apiKey  = '1eead5e19be7e6a484d068080b013391';
  final _baseUrl = 'api.themoviedb.org';
  final _idioma  = 'es-ES';

  int paginaPopular = 0;
  int paginaMejoresCalificadas = 0;
  int paginaProximosEstrenos = 0;


  //*Variables para almacenar las peticiones que recibimos
  List<Peliculas> resolucionNowPlaying = [];
  List<Peliculas> resolucionPopulares  = [];
  List<Peliculas> resolucionTopRated   = [];
  List<Peliculas> resolucionUpcoming   = [];

  Map<int, List<Casting>> resolucionCredits = {};
  
  PeticionesProvider(){
    //Insertar las peticiones
    getPeliculasEstreno();
    getPeliculasPopulares();
    getPeliculasMejoresCalificadas();
    getPeliculasProximosEstrenos();
  }


  getPeliculasEstreno() async {

    final dataNowPlaying = await _getDataJson('3/movie/now_playing'); 
    final respuestaNowPlaying = UltimasPeliculas.fromJson(dataNowPlaying);

    resolucionNowPlaying = respuestaNowPlaying.results;
    notifyListeners();
  }

  getPeliculasPopulares() async {
    paginaPopular++;
    final dataPopular = await _getDataJson('3/movie/popular',paginaPopular);
    final respuestaPopular = PeliculasPopulares.fromJson(dataPopular);

    resolucionPopulares = respuestaPopular.results;
    notifyListeners();
  }

  getPeliculasMejoresCalificadas() async {

    paginaMejoresCalificadas++;
    final dataTopRated = await _getDataJson('3/movie/top_rated',paginaMejoresCalificadas);
    final respuestaTopRated = MejoresCalificados.fromJson(dataTopRated);

    resolucionTopRated = respuestaTopRated.results;
    notifyListeners();
  }

  getPeliculasProximosEstrenos() async {
    paginaProximosEstrenos++;
    final dataUpcoming = await _getDataJson('3/movie/upcoming',paginaProximosEstrenos);
    final respuestaUpcoming = ProximosEstrenos.fromJson(dataUpcoming);

    resolucionUpcoming = respuestaUpcoming.results;
    notifyListeners();
  }

  Future<List<Casting>> getCreditosActores(int peliculaId) async {
    final dataCredits = await _getDataJson('3/movie/$peliculaId/credits');
    final respuestaCredits = Creditos.fromJson(dataCredits);

    resolucionCredits[peliculaId] = respuestaCredits.cast;
    return respuestaCredits.cast;
  }

  Future<String> _getDataJson(String endpoint,[int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language' : _idioma,
      'page' : '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

}