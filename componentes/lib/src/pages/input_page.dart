import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSelec = 'volar';
  List<String> _poderes = ['volar','super velocidad', 'Rayos x', 'Super Aliento', 'Super fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController(); //poner fecha en el input
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
           Divider(), //crea una linea divisoria
          _crearEmail(),
          Divider(), //crea una linea divisoria
          _crearContrasena(),
          Divider(), //crea una linea divisoria
          _crearFecha(context),
          Divider(), //crea una linea divisoria
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: , //entre directo a escribir
      textCapitalization: TextCapitalization.sentences, //poner mayuscula
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras 0'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      
    );
  }

  Widget _crearEmail() {
    return TextField(
      //autofocus: , //entre directo a escribir
      keyboardType: TextInputType.emailAddress,
      //textCapitalization: TextCapitalization.sentences, //poner mayuscula
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras 0'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          //helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
    
  }
  Widget _crearContrasena(){
    return TextField(
      //autofocus: , //entre directo a escribir
      keyboardType: TextInputType.text,
      obscureText: true,
      //textCapitalization: TextCapitalization.sentences, //poner mayuscula
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras 0'),
          hintText: 'Contrasena',
          labelText: 'Contrasena',
          //helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.password),
          icon: Icon(Icons.password)
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      //textCapitalization: TextCapitalization.sentences, //poner mayuscula
      controller: _inputFieldDateController,//poner fecha en field de fecha
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras 0'),
          hintText: 'Fecha nacimiento',
          labelText: 'Fecha nacimiento',
          //helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today_outlined),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }

  _selectDate(BuildContext context) async { //async para que espere al valor de la fecha elegido
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );
    if(picked != null ){
      setState(() {
        _fecha = picked.toString(); //se puede editar el formato de salida, para quitar la hora
        _inputFieldDateController.text = _fecha;
      });
    }  
  }

  
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista1 = [];

    _poderes.forEach((poder) {
      lista1.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,//ya que pide el tipo y poder es de tipo string
          )
      );
    });
    return lista1;
  }
  
  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSelec,
          items: getOpcionesDropdown(),
          onChanged:(opt){
            setState(() {
              print(opt);
              _opcionSelec = opt as String;
            });
          },
        )
      ],
    );
  }



}
