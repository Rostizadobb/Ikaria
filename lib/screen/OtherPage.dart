import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget{

  final String pageText;

  OtherPage(this.pageText);
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText), backgroundColor: Colors.redAccent,),
      body: BodyWidget(),
    );
  }
  
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Nombre"),
          subtitle: Text("CeeJee"),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text("Apellido"),
          subtitle: Text("GTA"),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text("Correo"),
          subtitle: Text("CeeJee@gta.com"),
          leading: Icon(Icons.mail),
        ),
        ListTile(
          title: Text("Celular"),
          subtitle: Text("550000911"),
          leading: Icon(Icons.phone),
        )
    ],);
  }
  
}

  

