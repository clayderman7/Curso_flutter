import 'package:flutter/material.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff004369),
    );
  }
}


class HeaderCircular extends StatelessWidget {
  const HeaderCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)),
        color: Color(0xff004369),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}


class _HeaderDiagonalPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;


    // Dibujar con el path y el lapiz
    final path = Path()
      ..moveTo(0, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}



class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}


class _HeaderTriangularPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}



class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}


class _HeaderPicoPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..lineTo(0, size.height * 0.25)
      ..lineTo(size.width * 0.5, size.height * 0.30)
      ..lineTo(size.width, size.height * 0.25)
      ..lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}


class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}


class _HeaderCurvoPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.50, size.width, size.height * 0.25)
      ..lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}


class HeaderWave extends StatelessWidget {
  const HeaderWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}


class _HeaderWavePainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0)
      ..lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}


class FooterWave extends StatelessWidget {
  const FooterWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _FooterWavePainter(),
      ),
    );
  }
}


class _FooterWavePainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = const Color(0xff004369)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..moveTo(0, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff004369),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}


class _HeaderWaveGradientPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 30.0),
      radius: 180,
    );

    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: <Color> [
        Color(0xff004369),
        Color(0xff01949A),
        Color(0xff613659),
        // Color(0xffFBC740),
      ]
    );

    final lapiz = Paint()
      ..shader = gradient.createShader(rect)
      ..color = const Color(0xff90ADC6)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    // Dibujar con el path y el lapiz

    final path = Path()
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25)
      ..lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}