import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key, required this.playerX, required this.playerWidth});

  final double playerX;
  final double playerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(
          (2 * playerX + playerWidth) / (2 - playerWidth), 0.9),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 10,
        width: MediaQuery
            .sizeOf(context)
            .width * playerWidth / 2,

        decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(5),
            border: Border.all()),
      ),
    );
  }
}
