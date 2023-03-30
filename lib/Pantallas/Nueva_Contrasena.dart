// ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                  //height: 200, 
                                  child: Center(
                                      child: Image.asset(
                                          'images/login-header-bg.jpg',
                                          width:sizeWh.width,
                                          fit: BoxFit.fitWidth)),
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
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Correo Electronico',
                                    prefixIcon: Icon(Icons.email,
                                    size: 28,),
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
                                style: const TextStyle(fontSize: 20),
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    prefixIcon: const Icon(Icons.lock,
                                    size: 28,),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext = !_obscuretext;
                                        });
                                      },
                                      icon: _obscuretext
                                          ? const Icon(Icons.visibility ,size: 28)
                                          : const Icon(Icons.visibility_off, size: 28),
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
                                style: const TextStyle(fontSize: 20),  
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                    hintText: 'Confirmar Contraseña',
                                    prefixIcon: const Icon(Icons.lock,
                                    size: 28,),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext2 = !_obscuretext2;
                                        });
                                      },
                                      icon: _obscuretext2
                                          ? const Icon(Icons.visibility,size: 28)
                                          : const Icon(Icons.visibility_off,size: 28),
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
                                    prefixIcon: Icon(Icons.password_sharp,
                                    size: 28,),
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
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: const TextStyle(fontSize: 20),  
                                keyboardType: TextInputType.number,
                                enableInteractiveSelection: false,
                                decoration: const InputDecoration(
                                    hintText: 'Codigo de recuperacion',
                                    prefixIcon: Icon(Icons.key_sharp,
                                    size: 28,),
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
                              child: const Text('CONFIRMAR NUEVA CONTRASEÑA',
                              style: TextStyle(fontSize: 20)),
                        )),
                        const Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    color: AppTheme.primary, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/recuperar');
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
