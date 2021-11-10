import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icons_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'alert_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

      return ListView( 
      children: _listaItems( snapshot.data!, context ),
      );
    },
  );


  
}

List<Widget> _listaItems( List<dynamic> data, BuildContext context) {
  final List<Widget> opciones = [];
  //if (data == null) {return [];}
  data.forEach((opt) { 

    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']), //const Icon(Icons.account_circle, color: Colors.blue),
      trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      onTap: (){
        Navigator.pushNamed(context, opt['ruta']);
        // final route = MaterialPageRoute(
        //   builder: (context){
        //     return const AlertPage();
        //   }
        // );
        // Navigator.push(context, route);
      },
    );

    opciones..add(widgetTemp)
            ..add(const Divider());
  });

  return opciones;
  
}