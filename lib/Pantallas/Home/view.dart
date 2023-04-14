// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ticienapp/Pantallas/Login.dart';
import 'package:ticienapp/Pantallas/Logueado/home.dart';
import 'package:ticienapp/Pantallas/Logueado/perfil.dart';

import '../Logueado/bloqueo.dart';
import '../Logueado/cuentas.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});
  
  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _selectDrawerItem = 0;
  late int indexPage;
  @override
  void initState() {
    super.initState();
    indexPage=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Bloqueo();
      case 2:
        return Cuentas();
      case 3:
        return Perfil();
      case 4:
        return _showAlertDialogLogout();          
    }
  }

  _showAlertDialogLogout() {
    showDialog<String>(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text('Cerrar sesión'),
            content: const Text('¿Desea cerrar su sesión?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No, cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                      return const Login();
                    }), (Route<dynamic> route) => false);
                  },
                  child: const Text('Si, cerrar sesión'))
            ],
          );
        });
  }

  _body(){
    return Column(
      children: [
        Expanded(child:  _getDrawerItemWidget(_selectDrawerItem),
                ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            children: [
              buttonSelect(0,Icons.home,'Inicio'),
              buttonSelect(1,Icons.block,'Bloquear'),
              buttonSelect(2,Icons.settings,'Cuentas'),
              buttonSelect(3,Icons.person,'Perfil'),
              buttonSelect(4,Icons.logout,'Salir')
            ],
          ),
        )
      ],
    );
    
  }

  Widget buttonSelect(index, IconData icon,String texto){
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            indexPage = index;
            _selectDrawerItem = index;
          });
        },
        child:Container(
            decoration: BoxDecoration(color: selectBackGroundColor(index)),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(icon, color: selectIconColor(index), size: selectIconSize(index)),
                (index != indexPage)
                  ?Text(texto):SizedBox()
                
                
                ]
            ,
            )
        )
      )
    );
  }

  Color selectBackGroundColor(index){
    if(index == indexPage){
      return Colors.black;
    }
      return Colors.white;
  }

  Color selectIconColor(index){
    if(index == indexPage){
      return Colors.white;
    }
      return Colors.black;
  }

  double selectIconSize(index){
    if(index == indexPage){
      return 45;
    }
      return 30;
  }

}

