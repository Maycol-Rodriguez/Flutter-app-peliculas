import 'package:flutter/material.dart';
import 'package:info_cinema/model/peliculas.dart';

class SliderWidget extends StatefulWidget {

  final String? titulo;
  final List<Peliculas> peliculas;

  const SliderWidget({
    Key? key, 
    this.titulo,
    required this.peliculas
    }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if( widget.titulo != null )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.titulo!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.peliculas.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ ,int index){

                final pelicula = widget.peliculas[index];

                return Container(
                  width: 150,
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                     
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:() =>  Navigator.pushNamed(context, 'detalles',arguments: pelicula),
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(5, 5),
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FadeInImage(
                              placeholder: const AssetImage('assets/no-image.jpg'), 
                              image: NetworkImage(pelicula.getImgPosterPath),
                              fit: BoxFit.cover,
                              height: 240,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        pelicula.title,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}