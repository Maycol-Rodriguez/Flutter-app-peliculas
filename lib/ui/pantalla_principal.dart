import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../widgets/slider.dart';

class PantallaPrincipal extends StatelessWidget {

  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          children: const [
            CardSwiperWidget(),
            SliderWidget(titulo: 'Populares',),
            SliderWidget(titulo: 'Series'),
            SliderWidget(titulo: 'Peliculas'),
          ],
        ),
      )
    );
  }
}

class CardSwiperWidget extends StatelessWidget {

  const CardSwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 5,
        layout: SwiperLayout.STACK,
        scrollDirection: Axis.horizontal,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index){
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detalles',arguments: 'pelicula'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                image: NetworkImage('https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
                height: 180,
                width: 90, 
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
