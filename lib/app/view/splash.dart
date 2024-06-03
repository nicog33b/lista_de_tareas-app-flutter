import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Hola mundo'),
            const Text('Hola mundo'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Hola mundo'),
                  Text('Hola mundo')
                ],
              ),
            ),

            Image.asset(
              '/goku.webp',
              width: 300,
              height: 300,
              fit: BoxFit.fitHeight,
              
            ),
          ],


        ),
      ),
    );
  }
}
