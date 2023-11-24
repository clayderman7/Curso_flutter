import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: Borrar
// import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    Key? key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.indigo,
    this.secondaryColor = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideshowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor = secondaryColor;
              Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario;

              return Column(
                children: [
                  if (dotsUp) _Dots(countSlides: slides.length),
                  Expanded(
                    child: _Slides( slides)
                  ),
                  if (!dotsUp) _Dots(countSlides: slides.length),
                ],
              );
            }
          )
        ),
      ),
    );
  }

}


class _Dots extends StatelessWidget {

  final int countSlides;

  const _Dots({
    Key? key,
    required this.countSlides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: const Color(0xff05445E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(countSlides, (index) => _Dot(index: index))
      ),
    );
  }
}


class _Dot extends StatelessWidget {

  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var ssModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage <= index + 0.5) {
      size = ssModel.bulletPrimario;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.bulletSecundario;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}



class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(this.slides , {Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {


  final pageViewController = PageController();

  @override
  void initState() {

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final Widget slide;
  const _Slide(this.slide , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: slide,
    );
  }
}



class _SlideshowModel with ChangeNotifier {

  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.blue;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario (double bullet) {
    _bulletPrimario = bullet;
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario (double bullet) {
    _bulletSecundario = bullet;
  }

  double get currentPage => _currentPage;
  set currentPage (double page) {
    _currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color color) {
    _secondaryColor = color;
  }

}