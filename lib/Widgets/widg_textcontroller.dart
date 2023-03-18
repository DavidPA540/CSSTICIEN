import 'package:flutter/material.dart';

// ignore: camel_case_types
class appTextcontroller extends StatelessWidget {
  final Color textcolor;
  final Color bordercolor;
  final String text;
  final Icon? icon;
  // ignore: prefer_typing_uninitialized_variables
  final controllador;

  const appTextcontroller(
      {Key? key,
      required this.textcolor,
      required this.bordercolor,
      required this.text,
      this.controllador,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: Center(
          child: TextFormField(
        controller: controllador,
        enableInteractiveSelection: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: icon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: bordercolor),
            )),
      )),
    );
  }
}
