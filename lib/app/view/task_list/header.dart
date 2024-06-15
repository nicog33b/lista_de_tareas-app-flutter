import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_tareas/app/model/task.dart';
import 'package:lista_tareas/app/view/components/h1.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 35,
      ),
      child: H1('Tareas'),
    );
  }
}
