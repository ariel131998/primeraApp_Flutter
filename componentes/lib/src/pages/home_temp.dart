import 'package:flutter/material.dart';

class  HomePageTemp extends StatelessWidget {
  HomePageTemp ({ Key? key }) : super(key: key);
  final opciones = ['uno','dos','tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes temp'),
      ),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems(){
  return opciones.map((item) {
    return Column(
      children: [
        ListTile(
          title: Text(item + '!'),
          subtitle: const Text('solo relleno'),
          leading: Icon(Icons.adb_rounded),
          trailing: Icon(Icons.arrow_back_ios_rounded),
          onTap: (){},
        ),
        const Divider()
      ],
    );
  }).toList();
  

  }

}

