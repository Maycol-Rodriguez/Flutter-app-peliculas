import 'package:flutter/material.dart';

class PantallaDetalle extends StatelessWidget {

  const PantallaDetalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'), 
                        image: NetworkImage('https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  IconButton(
                    onPressed: () => Navigator.pop(context), 
                    icon: const Icon(Icons.arrow_back,size: 40)
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SubTitulo',style: TextStyle(fontSize: 18)),
                    const Text('Titulo',style: TextStyle(fontSize: 24,)),
                    Row(
                      children: const [
                        Icon(Icons.star_border, size: 26,color: Colors.grey),
                        Text('calificacion y fecha de estreno!', style: TextStyle(fontSize: 16,color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Sinopsis',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text('Esse elit sint sunt duis sint ea mollit quis esse do nisi sint excepteur eu. Sunt est non est est dolore non veniam exercitation. Ex aute magna deserunt culpa eu et minim sunt cillum elit labore incididunt. Eu aliquip aliqua velit occaecat elit irure duis nulla minim nisi quis labore. Veniam Lorem eiusmod ad duis do do exercitation aute dolor. Consectetur eu esse pariatur officia esse aliqua aute velit sunt aliqua. Ullamco nulla dolor ex nulla occaecat eu cupidatat anim et ullamco sit laborum non id.Velit sit elit officia nulla non officia adipisicing id ex ut id aliquip. Velit enim qui culpa ex exercitation eiusmod. Aute anim Lorem Lorem sint ex et irure tempor non qui commodo amet Lorem eiusmod.', textAlign: TextAlign.justify,)
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Actores',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 340,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 180,
                          height: 250,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const FadeInImage(
                                  placeholder: AssetImage('assets/no-image.jpg'), 
                                  image: NetworkImage('https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
                                  width: 180,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text('actor.nombre',style: TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,maxLines: 3,textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      }
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}