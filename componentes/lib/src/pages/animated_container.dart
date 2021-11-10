import 'dart:math';

import 'package:flutter/material.dart';

class animatedContainer extends StatefulWidget {
  const animatedContainer({Key? key}) : super(key: key);

  @override
  _animatedContainerState createState() => _animatedContainerState();
}

class _animatedContainerState extends State<animatedContainer> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _boarderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista animated'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            seconds: 1
          ),
          curve: Curves.bounceIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _boarderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.color_lens),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    // _width += 50.0;
    // _height += 50.0;
    // _color = Colors.red;
    //pueden ir afuera pero se prefiere dentro del setState()
    return setState(() {
      // actualiza el redibujado del widget setState()
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _boarderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1,
      );
    });
  }
}
