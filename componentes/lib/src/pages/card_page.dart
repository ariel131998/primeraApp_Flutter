import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0), //espacio en los lados de cada widget
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(height: 30.0), //dejar espacio entre row
          _cardTipo2(),
          _cardTipo1(),
          const SizedBox(height: 30.0), //dejar espacio entre row
          _cardTipo2(),
          _cardTipo1(),
          const SizedBox(height: 30.0), //dejar espacio entre row
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, //sombras de la tarjeta
      shape:  RoundedRectangleBorder (borderRadius: BorderRadius.circular(20.0)), //redondeado de tarjea
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de la targeta'),
            subtitle: Text('Este es el subtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    // clipBehavior: Clip.antiAlias, // se supone que hace que todo este dentro de las tarjetas
    final  card = Container(//se cambio el card por un container
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://1.bp.blogspot.com/-oW_cccvgEuY/XGso01JnsCI/AAAAAAAACns/VlZjrFd8qgQzTmcyKLpsvwbAXSAd6m_4QCKgBGAs/w0/mountain-lake-nature-forest-landscape-clouds-scenery-4K-171.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),//mostrar mientras carga imagen
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://1.bp.blogspot.com/-oW_cccvgEuY/XGso01JnsCI/AAAAAAAACns/VlZjrFd8qgQzTmcyKLpsvwbAXSAd6m_4QCKgBGAs/w0/mountain-lake-nature-forest-landscape-clouds-scenery-4K-171.jpg'),
          // )
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Descripcion de la imagen')
            )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(2.0,10.0), //donde se va a colocar o que tan desfazado
            //spreadRadius: 
          )
        ],
        color: Colors.white //checar el margen de la tarjeta y especifica el colol de dentro tambien
      ),
      child: ClipRRect(// se encarga de cortar todo lo que se salga del container
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );



  }
}
