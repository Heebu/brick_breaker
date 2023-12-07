import 'dart:async';

import 'package:brick_breaker/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cover_screen.dart';
import 'my_ball.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Direction { UP, DOWN }

class _MyHomePageState extends State<MyHomePage> {
  double ballX = 0;
  double ballY = 0.9;
  double playerX = -0.2;
  double playerWidth = 0.3;
  bool isStarted = false;
  bool gameOver = false;

  var ballDirection = Direction.DOWN;

  void startGame() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        updateDirection();
        moveBall();
        isStarted = true;
        if (gameOver == true) {
          isStarted = false;
          ballY = 0.9;
          ballX = 0;
          timer.cancel();
        }
      });
    });
  }

  moveBall() {
    if (ballDirection == Direction.DOWN) {
      ballY += 0.01;
    } else if (ballDirection == Direction.UP) {
      ballY -= 0.01;
    }
  }

  updateDirection() {
    if (ballY >= 0.9) {
      if (ballX >= playerX && ballX <= playerX + playerWidth) {
        ballDirection = Direction.UP;
      } else {
        gameOver = true;
      }
    } else if (ballY <= -0.9) {
      ballDirection = Direction.DOWN;
    }
  }

  void moveLeft() {
    if (!(playerX - 0.1 <= -1)) {
      setState(() {
        playerX -= 0.1;
      });
    }
  }

  void moveRight() {
    if (!(playerX + playerWidth >= 1)) {
      setState(() {
        playerX += 0.1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        }
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.deepOrange[100],
          body: Stack(
            children: [
              //

              //Text to start game
              CoverScreen(isStart: isStarted),
              //ball
              MyBall(ballX: ballX, ballY: ballY),
              MyPlayer(playerX: playerX, playerWidth: playerWidth),
            ],
          ),
        ),
      ),
    );
  }
}
