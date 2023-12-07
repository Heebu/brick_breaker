import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({super.key, required this.isStart});

  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return isStart == false
        ? Container(
            alignment: Alignment(0, -0.2),
            child: Text('Tap to Play'),
          )
        : SizedBox.shrink();
  }
}
