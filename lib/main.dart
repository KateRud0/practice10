import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'platform_observer.dart';
import 'platform_cubit.dart';
import 'platform_screen.dart';

void main() {
  Bloc.observer = PlatformObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      home: BlocProvider(
        create: (context) => PlatformCubit(),
        child: PlatformScreen(),
      ),
    );
  }
}
