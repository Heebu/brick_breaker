import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall({
    super.key,
    required this.ballX,
    required this.ballY,
  });

  final double ballX;
  final double ballY;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(ballX, ballY),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      ),
    );
  }
}
