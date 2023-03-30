// ignore_for_file: file_names,camel_case_types, prefer_typing_uninitialized_variables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';
import 'package:ticienapp/Widgets/widg_connectivite.dart';

class Solicitar_Registro extends StatefulWidget {
  const Solicitar_Registro({Key? key}) : super(key: key);

  @override
  State<Solicitar_Registro> createState() => _Solicitar_Registro();
}

class _Solicitar_Registro extends State<Solicitar_Registro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final correo = TextEditingController();
  final nombre = TextEditingController();
  final fraccionamiento = TextEditingController();
  final ciudad = TextEditingController();
  var subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      //showMyDialog(context);
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _body(),
      backgroundColor: Colors.black,
    );
  }

  Widget _body() {
    var sizeWh = MediaQuery.of(context).size;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: AppTheme.primary))
        : Container(
            //padding: const EdgeInsets.all(8.0),
            width: sizeWh.width,
            height: sizeWh.height,
            color: AppTheme.secondary,
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
                            SizedBox(
                              width: sizeWh.width,
                              //height: 200,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    child: Center(
                                        child: Image.asset(
                                            'images/login-header-bg.jpg',
                                            width: sizeWh.width,
                                            fit: BoxFit.fitWidth)),
                                  ),
                                  // Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.start,
                                  //     children: [
                                  //       BackButton(
                                  //         color: AppTheme.white,
                                  //         onPressed: () {
                                  //           Navigator.of(context).pop();
                                  //         },
                                  //       )
                                  //     ]),
                                  Center(
                                    child: Image.asset(
                                        'images/ticien-logoblanco.png',
                                        width: 300,
                                        height: 200),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: nombre,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Nombre completo',
                                    prefixIcon: Icon(Icons.person, size: 28),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: correo,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Correo electrónico',
                                    prefixIcon: Icon(Icons.email, size: 28),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: fraccionamiento,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Nombre del fraccionamiento',
                                    prefixIcon: Icon(Icons.house, size: 28),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: ciudad,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Campo obligatorio";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Ciudad',
                                    prefixIcon: Icon(Icons.location_on_outlined,
                                        size: 28),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .9,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () => setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      _showAlertDialogLogout();
                                    }
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.primary),
                                  child: const Text('SOLICITAR REGISTRO',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            const Spacer(),
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
                            const Spacer()
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
            title: const Text('Prueba de Formulario'),
            content: const Text('Se llenaron los campos'),
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
