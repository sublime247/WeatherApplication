import 'package:flutter/material.dart';
import 'package:weatherapplication/screens/home_screen.dart';
import 'package:weatherapplication/screens/splash_screen.dart';
import 'package:weatherapplication/screens/welcome_screen.dart';

void main() {
  runApp(  MaterialApp(
      title: 'Flutter Demo',
     initialRoute: '/splash',
      routes: {
        '/splash':(context) =>const SplashScreen(),
        '/welcome':(context) => const WelcomeScreen(),
        '/home':(context) =>const WeatherPage()

      },
    )
  );
  }




