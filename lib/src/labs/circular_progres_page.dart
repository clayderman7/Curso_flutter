import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CircularProgresPage extends StatefulWidget {
  const CircularProgresPage({Key? key}) : super(key: key);

  @override
  State<CircularProgresPage> createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage> with SingleTickerProviderStateMixin {
  
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller!.addListener(() {
      // print('Valor controller: ${controller!.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller!.value)!;
      });

    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.orange,
          child: CustomPaint(
            painter: _MyRadialProgres(porcentaje: porcentaje),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje >= 100 ? {nuevoPorcentaje = 0, porcentaje = 0} : nuevoPorcentaje += 10;

          controller!.forward( from: 0.0);

          setState(() { });
        },
        backgroundColor: const Color(0xff04ECF0),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}



class _MyRadialProgres extends CustomPainter {

  final double porcentaje;

  _MyRadialProgres({
    required this.porcentaje
  });

  @override
  void paint(Canvas canvas, Size size) {

    //Circulo completado
    Paint paint = Paint()
        ..strokeWidth = 4
        ..color = const Color(0xff523A28)
        ..style = PaintingStyle.stroke;

    final center = Offset( size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height *0.5 );
    
    canvas.drawCircle(center, radius, paint);


    //Arco
    Paint paintArco = Paint()
      ..strokeWidth = 10
      ..color = const Color(0xff04ECF0)
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje /100);

    

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi/2,
        arcAngle,
        false,
        paintArco
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

