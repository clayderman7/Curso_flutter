import 'package:diseno_curso/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: const Scaffold(
        body: Center(
            // child: SvgPicture.asset('assets/svgs/slide5.svg')
          child: Column(
            children: [
              Expanded(
                  child: _Slides()
              ),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 70,
      // color: const Color(0xff05445E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
          _Dot(index: 3),
          _Dot(index: 4),
        ],
      ),
    );
  }
}


class _Dot extends StatelessWidget {

  final int index;

  const _Dot({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5
            ? Colors.indigo : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}



class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {


  final pageViewController = PageController();

  @override
  void initState() {

    pageViewController.addListener(() {
      // print('Pagina Actual ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;

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
        children: const [
          _Slide(svg:'assets/svgs/slide1.svg'),
          _Slide(svg:'assets/svgs/slide2.svg'),
          _Slide(svg:'assets/svgs/slide3.svg'),
          _Slide(svg:'assets/svgs/slide4.svg'),
          _Slide(svg:'assets/svgs/slide5.svg'),

        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String svg;
  const _Slide({Key? key, required this.svg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(svg),
    );
  }
}
