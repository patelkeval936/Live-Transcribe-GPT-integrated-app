import 'package:flutter/material.dart';

class ShadowedContainer extends StatelessWidget {
  const ShadowedContainer(
      {super.key, required this.child, this.radius = 0});
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(77, 121, 130, 1),
              spreadRadius: 4,
              blurRadius: 8,
            )
          ]),
      child:
          ClipRRect(borderRadius: BorderRadius.circular(radius), child: child),
    );
  }
}
