import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
const Shape({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Image.asset(
                'assets/shape.png', // Asegúrate de que la ruta es correcta y que la imagen está en la carpeta assets
                width: 141,
                height: 129,
              );
  }
}