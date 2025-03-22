import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child:  MaterialApp(
          title: 'Flappy Dash Game',
          theme: ThemeData(fontFamily: 'Chewy'),
          home: MainPage()
      ),
    );
  }
}


