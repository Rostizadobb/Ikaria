import 'package:flutter/material.dart';

class OtherPageTwo extends StatelessWidget{

  final String pageText;

  OtherPageTwo(this.pageText);
  
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
          title: Text("Tarjeta de Credito/Debito"),
          subtitle: Text("Añadir cuenta \n Usar cuenta existente"),
          leading: Icon(Icons.account_balance_wallet),
        ),
        ListTile(
          title: Text("Efectivo"),
          subtitle: Text("Consulte en cualquier tienda \n de auto servicio"),
          leading: Icon(Icons.attach_money),
        ),
        ListTile(
          title: Text("Paypal"),
          subtitle: Text("Añadir cuenta \n Usar cuenta existente"),
          leading: Icon(Icons.payment),
        )
    ],);
  }
  
}

  

