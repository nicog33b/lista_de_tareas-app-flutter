import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/components/h1.dart';

import 'package:lista_tareas/app/view/task_list/task_list.dart';

//components
import 'package:lista_tareas/app/view/components/shape.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Shape()
            ],
          ),
          const SizedBox(height: 79),
          Image.asset(
            'assets/onboarding-image.png', // Asegúrate de que la ruta es correcta y que la imagen está en la carpeta assets
            width: 180,
            height: 168,
          ),
          const SizedBox(height: 21),
          const H1('Lista de tareas', color: Color.fromARGB(255, 15, 129, 205),),
          const SizedBox(height: 21),
          GestureDetector(
            onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return TaskListPage();
            }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
