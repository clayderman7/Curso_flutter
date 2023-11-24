import 'package:flutter/material.dart';
import 'dart:math';


class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),

    );
  }
}


class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({Key? key}) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController? controller;

  Animation<double>? rotation;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000)
    );

    rotation = Tween( begin: 0.0, end: 2 * pi ).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut)
    );

    opacidad = Tween( begin: 0.1, end: 1.0 ).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0.0, 1.0, curve: Curves.easeOut) ),
    );
    
    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0 ).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut)
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut)
    );


    controller!.addListener(() {
      if(controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
    });


    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller!.forward();

    return AnimatedBuilder(
      animation: controller!,
      child: const _Cuadrado(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moverDerecha!.value, 0),
          child: Transform.rotate(
            angle: rotation!.value,
            child: Opacity(
              opacity: opacidad!.value,
              child: Transform.scale(
                  scale: agrandar!.value,
                  child: Opacity(
                      opacity: opacidadOut!.value,
                      child: child
                  )
              ),
            ),
          ),
        );
      }
    );
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.orangeAccent
      ),
    );
  }
}

