import 'dart:ui';

import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return             BlocBuilder<GameCubit,GameState>(
      builder: (context, state) => 
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
        child: Container(
                      color: Colors.black54,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Game Over!',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                   color: Color(0xffffca000),
                                letterSpacing: 4
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              'Score:${state.currentScrore}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                 letterSpacing: 4
      
                              ),
                            ),
                            SizedBox(height: 18,),
                            ElevatedButton(
                              onPressed: () => BlocProvider.of<GameCubit>(context).restartGame(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Play Again!",
                                style: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 2
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
      ),
    );
     
  }
}
