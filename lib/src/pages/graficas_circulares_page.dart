import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';


class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xffC4AE78),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.deepOrange,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.teal,),
            ],
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6F5B3E),
        onPressed: () {
          setState(() {
            porcentaje >= 100 ? porcentaje = 0 : porcentaje += 10;
          });
        },
        child: const Icon(Icons.refresh_rounded, color: Color(0xff04ECF0)),
      ),
    );
  }
}


class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.indigo,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.amberAccent,
      ),
    );
  }
}
