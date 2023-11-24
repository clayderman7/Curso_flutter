import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;

  const RadialProgress({
    Key? key,
    required this.porcentaje,
    this.colorPrimario = Colors.indigo,
    this.colorSecundario = Colors.grey
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>  with SingleTickerProviderStateMixin {

  AnimationController? controller;
  double? porcentajeAnterior;


  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller!.forward(from: 0.0);
    final diferenciaAnimar  = widget.porcentaje - porcentajeAnterior!;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgres(
              porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller!.value),
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario
            ),
          ),
        );
      }
    );


  }
}



class _MyRadialProgres extends CustomPainter {

  final double porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;

  _MyRadialProgres({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario
  });

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0,0),
      radius: 180
    );

    const Gradient gradient = LinearGradient(
      colors: <Color>[
        Color(0xff145DA0),
        Color(0xff04ECF0),
        Colors.orangeAccent
      ]
    );

    //Circulo completado
    Paint paint = Paint()
      ..strokeWidth = 4
      // ..color = const Color(0xff523A28)
      ..color = colorSecundario!
      ..style = PaintingStyle.stroke;

    final center = Offset( size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height *0.5 );

    canvas.drawCircle(center, radius, paint);


    //Arco
    Paint paintArco = Paint()
      ..strokeWidth = 10
      // ..color = const Color(0xff04ECF0)
      // ..color = colorPrimario!
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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