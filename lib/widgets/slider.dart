import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {

  final String titulo;

  const SliderWidget({
    Key? key, 
    required this.titulo
    }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.titulo,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          // Container(width: 90, height: 180, color: Colors.green,),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( context,int index){ 
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap:() =>  Navigator.pushNamed(context, 'detalles',arguments: 'pelicula'),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: const FadeInImage(
                              placeholder: AssetImage('assets/no-image.jpg'), 
                              image: NetworkImage('https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
                              fit: BoxFit.cover,
                              height: 200,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text('Title')
                    ],
                  );
                },
              )
            ),
        ],
      ),
    );
  }
}