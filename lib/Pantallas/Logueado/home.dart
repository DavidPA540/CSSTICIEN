
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _banner(),
          _ListView(context),

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
  Center(
    child: Image.asset(
      'images/ticien-logoblanco.png',
      width: 300,
      height: 200),
      ),
    ],
  );
}

Widget _ListView(context){
  return SizedBox(
              child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height * .6 ,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 4,
                          child: ListTile(
                            leading: Image.asset('images/contacto.png') ,
                            title: Text("Telefono", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                            subtitle: Text("Registrados por la caseta" ,style: TextStyle(fontSize: 18,)),
                            isThreeLine: true,
                            dense: true,
                            onTap: () {
                            },
                          )
                      ); }
                    ),
              ),
            ));
}
