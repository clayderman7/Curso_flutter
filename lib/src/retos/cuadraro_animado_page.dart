import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatefulWidget {
  const CuadradoAnimadoPage({Key? key}) : super(key: key);

  @override
  State<CuadradoAnimadoPage> createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage> with SingleTickerProviderStateMixin {


  AnimationController? controller;

  Animation<double>? derecha;
  Animation<double>? arriba;
  Animation<double>? izquierda;
  Animation<double>? centro;




  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );


    derecha = Tween( begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0, 0.25, curve: Curves.bounceOut)),
    );

    arriba = Tween( begin: 0.25, end: -150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)),
    );

    izquierda = Tween( begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)),
    );

    centro = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)),
    );

    controller!.addListener(() {
      if(controller!.status == AnimationStatus.completed) {
        controller!.repeat();
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

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: controller!,
        child: const Center(child: _Rectangulo()),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(derecha!.value, 0),
            child: Transform.translate(
              offset: Offset(0, arriba!.value ),
              child: Transform.translate(
                offset: Offset(izquierda!.value, 0),
                child: Transform.translate(
                  offset: Offset(0, centro!.value),
                  child: child,
                ),
              ),
            ),


          );
        },
      ),
    );
  }
}





class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      color: const Color(0xff003060),
    );
  }
}


class _CuadradoAnimado extends StatelessWidget {
  const _CuadradoAnimado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Rectangulo();
  }
}
