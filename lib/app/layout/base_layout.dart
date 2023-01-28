import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Size size;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const BaseLayout(
      {super.key, required this.size, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(top: 10),
      padding: padding == null
          ? const EdgeInsets.only(
              top: 30,
              bottom: 10,
              left: 20,
              right: 20,
            )
          : padding,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -3),
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 3,
            blurRadius: 7,
          )
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(60),
        ),
      ),
      child: child,
    );
  }
}
