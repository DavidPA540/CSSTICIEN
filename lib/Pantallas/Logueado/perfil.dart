
import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _banner(),
          _ListView(context),
          _ListView2(context),
        ],
      ),
    );
  }
}

Widget _banner(){
  return Stack(
  children: [
    SizedBox(
      child: Center(
        child: Image.asset(
      'images/login-header-bg.jpg',
    fit: BoxFit.cover,
  )),
  ),
  Container(
    height: 200,
    child: const Center(
      child: Text('MI PERFIL', style: TextStyle(color: AppTheme.white, fontSize: 40,fontWeight: FontWeight.bold),),
        ),
  ),
    ],
  );
}

Widget _ListView(context){
  var username;
  var apellido;
  var correo;
  var contresna;
  var contresnaconfirm;
  var status;
  return Center(
          child: Container(
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                TextField(
                              controller: username,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Nombre',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: apellido,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Apellido',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: correo,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Correo',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            const SizedBox(height: 16),
                TextField(
                              controller: status,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Status',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const Text(
                  'Deje en blanco si no va a cambiar su clave',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.muted
                  ),
                ),            
                TextField(
                              controller: contresna,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: contresnaconfirm,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Confirmar Contraseña',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Text(
                    'AGREGAR CUENTA',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
                
              ],
            ),
          ),
        );
}

Widget _ListView2(context){
  var username;
  var apellido;
  var correo;
  var contresna;
  var contresnaconfirm;
  return Center(
          child: Container(
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'ALTA DE CUENTA FAMILIAR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black

                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                              controller: username,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Nombre',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: apellido,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Apellido',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: correo,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Correo',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: contresna,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Confirmar contraseña',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                TextField(
                              controller: contresnaconfirm,
                              enableInteractiveSelection: false,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
        );
}
