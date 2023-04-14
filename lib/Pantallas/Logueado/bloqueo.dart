
import 'package:flutter/material.dart';
import 'package:ticienapp/css.dart';

class Bloqueo extends StatefulWidget {
  const Bloqueo({Key? key}) : super(key: key);

  @override
  State<Bloqueo> createState() => _BloqueoState();
}

class _BloqueoState extends State<Bloqueo> {
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
          SizedBox(height: 16),
          _ListView(context),
          _ListView2(context)

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
      child: Text('BLOQUEO', style: TextStyle(color: AppTheme.white, fontSize: 40,fontWeight: FontWeight.bold),),
        ),
  ),
    ],
  );
}

Widget _ListView(context){
  return SizedBox(
              child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height * .25 ,
                child: Card(
                          elevation: 4,
                          child: ListTile(
                            title: const Text("Notifica al administrador la restricción de acceso de una visita, empleado p empresa de servicio.", 
                            style: TextStyle(fontSize: 18, color:AppTheme.muted),
                            textAlign: TextAlign.justify, ),
                            subtitle: const Text("Esta información se enviara al administrador para darle seguimiento especifico y activar lanotificación a caste de vigilancia" ,
                            style: TextStyle(fontSize: 18, color: AppTheme.black),
                            textAlign: TextAlign.justify,),
                            isThreeLine: true,
                            dense: true,
                            onTap: () {
                            },
                          )
                    ),
              ),
            ));
}

Widget _ListView2(context){
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
                  'Tipo de acceso a bloquear*',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.muted
                  ),
                ),
                SizedBox(height: 16),
                DropdownButton<String>(
                  value: 'SELECCIONE UNA OPCION',
                  onChanged: (String? newValue) {},
                  items: <String>['SELECCIONE UNA OPCION', 'VISITA', 'EMPLEADO', 'EMPRESA DE SERVICIO']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  underline: Container(
                    height: 2,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Text(
                      'ENVIAR INFORMACIÓN',
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





