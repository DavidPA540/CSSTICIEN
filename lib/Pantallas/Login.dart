// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppTheme.primary))
          : Container(
              padding: const EdgeInsets.all(8.0),
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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Stack(
                              children: [
                                SizedBox(
                                  child: Center(
                                      child: Image.asset(
                                          'images/login-header-bg.jpg',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          height: 250)),
                                ),
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
                              width: MediaQuery.of(context).size.width * .9,
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
                              width: MediaQuery.of(context).size.width * .9,
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
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.text,
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
                              width: MediaQuery.of(context).size.width * .9,
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
                                    prefixIcon: Icon(Icons.password),
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
                              child: const Text('Acceder'),
                        )),const Spacer(),
                            SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => setState(() {
                            Navigator.pushNamed(context, '/recuperar');
                          }), 
                          style: ElevatedButton.styleFrom(
                              backgroundColor:  AppTheme.primary),
                              child: const Text('Olvido su contraseña'),
                        )),
                            const Spacer(),
                            const Text('¿No tienes una cuenta?',
                                style: TextStyle(
                                    color: AppTheme.black, fontSize: 15)),
                                  TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                    color: AppTheme.primary, fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/registrar');
                                  },
                                  child: const Text('Regístrate aquí'),
                                ),  
                          ],
                        ),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
    );
  }

  _showAlertDialogLogout() {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text('Prueba de Formulario'),
            content: const Text(
                'Se llenaron los campos'),
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
