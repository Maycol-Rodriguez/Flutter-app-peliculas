import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:info_cinema/model/peliculas.dart';

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
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.white,
      child: Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        scrollDirection: Axis.horizontal,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index){

          final pelicula = peliculas[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detalles',arguments: pelicula),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(pelicula.getImgPosterPath),
                height: 180,
                width: 90, 
                placeholder: const AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}