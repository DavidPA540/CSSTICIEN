// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticienapp/Widgets/widg_connectivite.dart';
import 'package:ticienapp/css.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final correo = TextEditingController();
  final password = TextEditingController();
  final clavefra = TextEditingController();
  bool _obscuretext = true;
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
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  Widget _body() {
    var sizeWh = MediaQuery.of(context).size;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: AppTheme.primary))
        : Container(
            //  padding: const EdgeInsets.all(8.0),
            width: sizeWh.width,
            height: sizeWh.height,
            color: AppTheme.secondary,
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 0),
                      child: Container(
                        //color: Colors.red,
                        width: sizeWh.width,
                        height: sizeWh.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: sizeWh.width,
                              height: 200,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    child: Center(
                                        child: Image.asset(
                                      'images/login-header-bg.jpg',
                                      width: sizeWh.width,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
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
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Correo Electronico',
                                    prefixIcon: Icon(Icons.email, size: 28),
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
                                    return "Minimo 6 caracteres,una mayúscila,una minúscula y un número";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    prefixIcon:
                                        const Icon(Icons.lock, size: 28),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext = !_obscuretext;
                                        });
                                      },
                                      icon: _obscuretext
                                          ? const Icon(Icons.visibility,
                                              size: 28)
                                          : const Icon(Icons.visibility_off,
                                              size: 28),
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
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: const TextStyle(fontSize: 20),
                                keyboardType: TextInputType.number,
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                  hintText: 'Clave fraccionamiento',
                                  prefixIcon: Icon(Icons.password, size: 28),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppTheme.primary),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
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
                                  child: const Text('Acceder',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            const Spacer(),
                            SizedBox(
                                width: sizeWh.width * .9,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () => setState(() {
                                    Navigator.pushNamed(context, '/recuperar');
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.primary),
                                  child: const Text('Olvido su contraseña',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            const Spacer(),
                            const Text('¿No tienes una cuenta?',
                                style: TextStyle(
                                    color: AppTheme.black, fontSize: 20)),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    color: AppTheme.primary, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/registrar');
                              },
                              child: const Text('Regístrate aquí'),
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
