import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({ Key? key }) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = List.empty(growable: true);
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // llamar al metodo crear 10 para que se redibuje por primera vez con el widget
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent){//es scroll y la pantalla esta en el maximo
        //_agregar10();
        _traerInfo();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearListas(),
          _crearLoading(),
        ]
      ),
    );
  }

  Widget _crearListas(){
    
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(//si no sabemoos cuantos elementos van a ser
        controller: _scrollController,//permite controlar la posicion de la lista
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){// se encarga de redibujar los widgets conforme sea necesario. index posicion
          final imagen = _listaNumeros[index];
          return FadeInImage(//permite colocar el gif para mostrar que se esta cargando la imagen
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          );
        },
      ),
    );

  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration (seconds: 2);
    new Timer (duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }


  void _agregar10(){
    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {

    });
  }

  Future _traerInfo() async{ // va a regresar un future (algo por lo que va a esperar/no lo tendra al momento)

    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);

    
  }
  void respuestaHTTP(){
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );
      _agregar10();

    }

  @override //desechar variables cuando se destruya la pagina.
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  _crearLoading() {
    if( _isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,//ocupe el tamano maximo de la pantalla en vertical
        mainAxisAlignment: MainAxisAlignment.end,// se vaya hasta abjo
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    }
    else return Container();
  }
}