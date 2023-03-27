import 'package:flutter/material.dart';

class RenderColorWidget extends StatelessWidget {
  final Color color;
  final String number;

  const RenderColorWidget(
      {super.key, required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    print(number);
    return Container(
      color: color,
      height: 300,
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
