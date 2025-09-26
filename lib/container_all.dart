import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  Widget child;
  ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(129, 164, 202, 227),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}