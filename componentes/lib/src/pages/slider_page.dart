import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  const SliderPage({ Key? key }) : super(key: key);
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamano de imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck) ? null :  (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    
    return Image(
      image: NetworkImage('https://ih1.redbubble.net/image.1810038562.7144/st,small,507x507-pad,600x600,f8f8f8.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _crearCheckBox() {

    return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor as bool;

        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor as bool;

        });
      },
    );
  }


}