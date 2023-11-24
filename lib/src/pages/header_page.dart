import 'package:flutter/material.dart';

import '../widgets/header.dart';


class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWaveGradient(),
    );
  }
}


