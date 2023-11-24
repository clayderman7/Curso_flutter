import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {

  final IconData icon;
  final String? texto;
  final Color? color1;
  final Color? color2;
  final void Function()? onPress;


  const FatButton({
    super.key,
    required this.icon,
    this.texto = 'Name button',
    this.color1 = Colors.teal,
    this.color2 = Colors.amber,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _FatButtonBackground( icon, color1, color2 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(child: Text(texto!, style: const TextStyle( color: Colors.white, fontSize: 18),)),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40)
            ],
          )

        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color? color1;
  final Color? color2;

  const _FatButtonBackground(
    this.icon,
    this.color1,
    this.color2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(4,6), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1!,
            color2!,
            // Color(0xff6989f5),
            // Color(0xff906EF5),
          ]
        )

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
            ),
          ],
        ),
      ),
    );
  }
}
