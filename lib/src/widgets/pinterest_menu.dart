import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu({
    super.key,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xffD6AD60),
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_Chart');}),
  //   PinterestButton(icon: Icons.search, onPressed: () { print('search');}),
  //   PinterestButton(icon: Icons.notifications, onPressed: () { print('notifications');}),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('supervised_user_circle');}),
  // ];
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _MenuModel(),
        child: AnimatedOpacity(
          opacity: show ? 1: 0,
          duration: const Duration(microseconds: 250),
          child: Builder(
              builder: (context) {

                Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
                Provider.of<_MenuModel>(context).activeColor = activeColor;
                Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

                return _PinterestMenuBackground(
                  child: _MenuItems( menuItems: items)
                );
              }
          )
        )
    );
  }
}


class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    Color? backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -5
            )
          ]
      ),
      child: child,
    );
  }
}



class PinterestButton {
  final void Function()? onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton > menuItems;

  const _MenuItems({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButtons( index: i, item: menuItems[i]))
    );
  }
}


class _PinterestMenuButtons extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButtons({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed!();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index)? 35 : 25,
          color: (itemSeleccionado == index)? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}


class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color? backgroundColor = Colors.white;
  Color? activeColor = const Color(0xffD6AD60);
  Color? inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado (int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }

}