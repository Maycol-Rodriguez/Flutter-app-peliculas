import 'package:card_swiper/card_swiper.dart';
import 'package:info_cinema/model/peliculas.dart';
import 'package:info_cinema/widgets/widgets.dart';

class CardSwiperWidget extends StatelessWidget {

  final List<Peliculas> peliculas;

  const CardSwiperWidget({
    Key? key,
    required this.peliculas
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (peliculas.isEmpty){
      return Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: size.height * .5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        fade: 0.3,
        scale: 0.4,
        outer: true,
        control: const SwiperControl(),
        pagination: const SwiperPagination(),
        viewportFraction: 0.6,
        autoplayDisableOnInteraction: true,
        scrollDirection: Axis.horizontal,
        itemCount: peliculas.length,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index){

          final pelicula = peliculas[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detalles',arguments: pelicula),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(pelicula.getImgPosterPath),
                fit: BoxFit.cover,
                height: 180,
                width: 90, 
              ),
            ),
          );
        },
      ),
    );
  }
}