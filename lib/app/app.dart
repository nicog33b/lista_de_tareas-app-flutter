import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/home.dart';
import 'package:lista_tareas/app/view/splash.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const primary = Color.fromARGB(255, 169, 223, 232);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);

    return MaterialApp(
      title: 'Lista de tareas',
      theme: ThemeData(
    

    
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: textColor,
          displayColor: textColor
        ),
        useMaterial3: true,
      ),
      home:SplashPage()
    );
  }
}
