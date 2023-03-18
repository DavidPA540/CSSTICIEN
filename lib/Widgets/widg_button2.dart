import 'package:flutter/material.dart';

class ButtonApp2 extends StatelessWidget {
  final Color textcolor;
  final String text;

  

  ButtonApp2({
    Key? key,
    required this.textcolor,
    required this.text,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final ButtonStyle ButtonSecondary = ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 27, 245, 38), elevation: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: ElevatedButton(
        style: ButtonSecondary,
        onPressed: (){},
        child: Text(text),
      ),
    );
  }
}
