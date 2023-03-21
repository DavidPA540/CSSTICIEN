// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';
import 'package:ticienapp/Widgets/widg_connectivite.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Nueva_contrasena extends StatefulWidget {
  const Nueva_contrasena({Key? key}) : super(key: key);

  @override
  State<Nueva_contrasena> createState() => _Nueva_contrasena();
}

class _Nueva_contrasena extends State<Nueva_contrasena> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  bool isLoading = false;
  final correo = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final clavefra = TextEditingController();
  final claverecu = TextEditingController();
  bool _obscuretext = true;
  bool _obscuretext2 = true;
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

  Widget _body(){
    var sizeWh = MediaQuery.of(context).size;
    return isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppTheme.primary))
          : Container(
              //padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppTheme.secondary,
              child: Stack(
                children: <Widget>[
                  Form(
                  key: _formKey,
                  child:Center(
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
                                  width: sizeWh.width,
                                  height: 200, 
                                  child: Center(
                                      child: Image.asset(
                                          'images/login-header-bg.jpg',
                                          width:sizeWh.width,
                                          fit: BoxFit.fitWidth)),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                            const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child:TextFormField(
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
                            const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child: TextFormField(
                                obscureText: _obscuretext,
                                controller: password,
                                validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Campo obligatorio";
                                    }
                                    return null;
                                  }),
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext = !_obscuretext;
                                        });
                                      },
                                      icon: _obscuretext
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child: TextFormField(
                                obscureText: _obscuretext2,
                                controller: passwordConfirm,
                                validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Campo obligatorio";
                                    }
                                    return null;
                                  }),
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                    hintText: 'Confirmar Contraseña',
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext2 = !_obscuretext2;
                                        });
                                      },
                                      icon: _obscuretext2
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppTheme.primary),
                                    )),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: sizeWh.width * .9,
                              height: 55,
                              child: TextFormField(
                                controller: clavefra,
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
                                    prefixIcon: Icon(Icons.password_sharp),
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
                                controller: claverecu,
                                validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Campo obligatorio";
                                    }
                                    return null;
                                  }),
                                keyboardType: TextInputType.number,
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Codigo de recuperacion',
                                    prefixIcon: Icon(Icons.key_sharp),
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
                              backgroundColor:  AppTheme.primary),
                              child: const Text('CONFIRMAR NUEVA CONTRASEÑA'),
                        )), 
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
            title: const Text('Nueva contraseña'),
            content: const Text(
                'Se ha cambiado la contraseña adecuadamente'),
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
