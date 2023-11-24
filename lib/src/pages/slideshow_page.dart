import 'package:diseno_curso/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,
      body: Column(
        children: const [
          Expanded(
            child: MySlideshow()
          ),
          Expanded(
              child: MySlideshow()
          )
        ],
      )

    );
  }
}


class MySlideshow extends StatelessWidget {
  const MySlideshow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      primaryColor: Colors.orangeAccent,
      secondaryColor: Colors.black87,
      dotsUp: false,
      slides: [
        SvgPicture.asset('assets/svgs/slide1.svg'),
        SvgPicture.asset('assets/svgs/slide2.svg'),
        SvgPicture.asset('assets/svgs/slide3.svg'),
        SvgPicture.asset('assets/svgs/slide4.svg'),
        SvgPicture.asset('assets/svgs/slide5.svg'),
      ],
    );
  }
}
