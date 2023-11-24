import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        )
        // body: PinterestMenu(),
        // body: PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        height: 65,
        width: widthScreen,
        child: Align(
          child: PinterestMenu(
            show: mostrar,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_Chart');}),
              PinterestButton(icon: Icons.search, onPressed: () { print('search');}),
              PinterestButton(icon: Icons.notifications, onPressed: () { print('notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('supervised_user_circle');}),
            ],
          )
        ),
      ),
    );
  }
}




class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  ScrollController controller = ScrollController();
  double scrollBefore = 0;

  @override
  void initState() {
    controller.addListener(() {

      if(controller.offset > scrollBefore && controller.offset > 150){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollBefore = controller.offset;

    });
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: MasonryGridView.builder(
          controller: controller,
          itemCount: 8,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2 ),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 4, child: _PinterestItems(index: index));
          },
        )
    );
  }
}


class _PinterestItems extends StatelessWidget {
  final int index;
  const _PinterestItems({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff189AB4),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          // height: (80*(index+1)).toDouble(),
          height: rndNumber(),
          child: Center(
            child: CircleAvatar(
                minRadius: 20,
                maxRadius: 30,
                backgroundColor: Colors.white,
                child: Text('$index', style: const TextStyle(color: Colors.black))
            ),
          ),
        )
    );
  }

  double rndNumber() {
    return Random().nextInt(100)+ 300;
  }

}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar ;
  set mostrar (bool value) {
    _mostrar = value;
    notifyListeners();
  }
}