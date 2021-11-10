import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: ()=> _mostrarAlert(context),//funcion que llama al metodo mostrar alert
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_alert),
        onPressed: (){
          Navigator.pop(context);
        }
      ),
     

    );
  }

  void _mostrarAlert(BuildContext context){

    showDialog(
      context: context, //decirle donde estoy 
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,//se adapte al contenido interno de las columnas.
            children: <Widget>[
              Text('Este es el contenido'),
              FlutterLogo( size: 100.0,)
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), //regresar a pantalla anterior
              child: Text('cancelar')
            ),
            TextButton(
              onPressed: ()=>Navigator.of(context).pop(), 
              child: Text('Ok')
            )
          ],
        );
      }
    );

  }

}