import "package:flutter/material.dart";

class H1 extends StatelessWidget {
  const H1(this.text, {Key? key, this.color}) : super(key: key);

//parametros

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color,
          ),
    );
  }
}
