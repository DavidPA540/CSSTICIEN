import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';

class ButtonApp extends StatelessWidget {
  final Color textcolor;
  final String text;

  ButtonApp({
    Key? key,
    required this.textcolor,
    required this.text,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final ButtonStyle ButtonPrimary =
      ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, elevation: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: ElevatedButton(
        style: ButtonPrimary,
        onPressed: (){},
        child: Text(text),
      ),
    );
  }
}
