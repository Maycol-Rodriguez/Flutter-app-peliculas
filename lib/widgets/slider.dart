import 'package:info_cinema/model/model.dart';

class SliderWidget extends StatefulWidget {

  final String? titulo;
  final List<Peliculas> peliculas;
  final Function siguientePeticion;

  const SliderWidget({
    Key? key, 
    this.titulo,
    required this.peliculas, 
    required this.siguientePeticion
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  final ScrollController controlador = ScrollController();

  @override
  void initState() {

    super.initState();

    double? maxScrollTemp;

    controlador.addListener(() {

      double positionScroll = controlador.position.pixels; //posicion pixel a pixel
      double maxScroll = controlador.position.maxScrollExtent; //tamaño total del scroll

      if ( positionScroll >= ( maxScroll - 900 ) ) {

        if (maxScrollTemp == maxScroll) {
          return;
        } else {
          widget.siguientePeticion();
          maxScrollTemp = maxScroll;
        }

      }
    });
  }
  
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (widget.peliculas.isEmpty){
      return Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: size.height * .3,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      height: 360,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if( widget.titulo != null )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.titulo!,style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
            ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: controlador,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.peliculas.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ ,int index) => ScrollHorizontal(pelicula: widget.peliculas[index], heroIds: '${widget.titulo}-$index-${widget.peliculas[index].id}'),
            )
          ),
        ],
      ),
    );
  }
}

class ScrollHorizontal extends StatelessWidget {

  final Peliculas pelicula;
  final String heroIds;

  const ScrollHorizontal({
    Key? key,
    required this.pelicula, 
    required this.heroIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    pelicula.heroId = heroIds; 

    return Container(
      width: 150,
      height: 240,
      margin: const EdgeInsets.symmetric(horizontal: 10),
         
      child: Column(
        children: [
          GestureDetector(
            onTap:() =>  Navigator.pushNamed(context, 'detalles',arguments: pelicula),
            child: Container(
              decoration: boxDecoration(),
              child: Hero(
                tag: pelicula.heroId!,
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
          ),
          const SizedBox(height: 10,),
          Text(
            pelicula.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
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
  );
}