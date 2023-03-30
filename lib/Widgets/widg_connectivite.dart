import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';

void showMyDialog(context) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    _showSnackBarWifi(context);
  }else if (connectivityResult == ConnectivityResult.mobile) {
    _showSnackBarMobile(context);
  }else if(connectivityResult == ConnectivityResult.none){
    _showSnackBarnotWifi(context);
  }
  
}

_showSnackBarnotWifi(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: const <Widget>[
          Icon(Icons.error, color: AppTheme.white),
          SizedBox(width: 4),
          Expanded(
          child: Text(' Se Perdio la conexion',
          style: TextStyle(fontSize: 20),
           textAlign: TextAlign.justify))
        ]),
        backgroundColor: AppTheme.error,
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating));
  }

_showSnackBarWifi(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: const <Widget>[
          Icon(Icons.wifi, color: AppTheme.white),
          SizedBox(width: 4),
          Expanded(
          child:Text(' Se establecio la conexion a la red',
          style: TextStyle(fontSize: 20),
           textAlign: TextAlign.justify))
        ]),
        backgroundColor: AppTheme.primary
        ,
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating));
  }

_showSnackBarMobile(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: const <Widget>[
          Icon(Icons.signal_cellular_alt, color: AppTheme.white),
          SizedBox(width: 4),
          Expanded(
          child:Text(' Se establecio la conexion a datos',
          style: TextStyle(fontSize: 20),
           textAlign: TextAlign.justify))
        ]),
        backgroundColor: AppTheme.primary,
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating),
        );
  }
