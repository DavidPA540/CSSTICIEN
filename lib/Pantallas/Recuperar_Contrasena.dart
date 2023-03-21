// ignore_for_file: file_names,camel_case_types

import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';
import 'package:ticienapp/Widgets/widg_connectivite.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Recuperar_Contrasena extends StatefulWidget {
  const Recuperar_Contrasena({Key? key}) : super(key: key);

  @override
  State<Recuperar_Contrasena> createState() => _Recuperar_Contrasena();
}

class _Recuperar_Contrasena extends State<Recuperar_Contrasena> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final correo = TextEditingController();
  final fraccionamiento = TextEditingController();
  var subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      showMyDialog(context);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _body()
        ],
      )
    );
  }

  Widget _body() {
    var sizeWh = MediaQuery.of(context).size;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: AppTheme.primary))
        : Container(
            width: sizeWh.width,
            height: sizeWh.height,
            // color: AppTheme.secondary,
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: sizeWh.width,
                        height: sizeWh.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Stack(
                              children: [
                                SizedBox(
                                  child: Center(
                                      child: Image.asset(
                                          'images/login-header-bg.jpg',
                                          width: sizeWh.width,
                                          fit: BoxFit.fitWidth)),
                                ),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     BackButton(
                                         color: AppTheme.white,
                                         onPressed: () {
                                           Navigator.of(context).pop();
                                         },
                                       )
                                     ]),
                                Center(
                                  child: Image.asset(
                                      'images/ticien-logoblanco.png',
                                      width: 300,
                                      height: 200),
                                ),
                              ],
                            ),
                            //const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: correo,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Correo Electronico',
                                    prefixIcon: Icon(Icons.email),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            //const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: fraccionamiento,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                keyboardType: TextInputType.number,
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Clave fraccionamiento',
                                    prefixIcon: Icon(Icons.password),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            //const Spacer(),
                            SizedBox(
                                width: sizeWh.width * .9,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () => setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      _showAlertDialogLogout();
                                    }
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.primary),
                                  child: const Text('RECUPERAR CONTRASEÑA'),
                                )),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    color: AppTheme.primary, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/nueva_Contra');
                              },
                              child:
                                  const Text('Ingresar codigo de recuperación'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    color: AppTheme.primary, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text('Volver'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _showAlertDialogLogout() {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text('Envio de correo'),
            content: const Text(
                'Se ha enviado un mensaje a su correo registrado con un codigo de recuperación'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okey')),
            ],
          );
        });
  }
}
