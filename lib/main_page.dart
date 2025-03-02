import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'flappy_dash_game.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late FlappyDashGame _flappyDashGame;

  @override
  void initState() {
    // TODO: implement initState
    _flappyDashGame=FlappyDashGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _flappyDashGame,
      backgroundBuilder: (context) {
        return Container(
          color: Colors.grey,
        );
      },
    );
  }
}
