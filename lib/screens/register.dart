import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  String nameEn = 'Name :';

  // Mathod
  Widget nameText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          labelText: nameEn,
          labelStyle: TextStyle(color: Colors.blue),
          helperText: 'Type Display Name',
          helperStyle: TextStyle(color: Colors.blue),
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        style: TextStyle(color: Colors.orange),
        decoration: InputDecoration(
          labelText: 'Email :',
          labelStyle: TextStyle(color: Colors.orange),
          helperText: 'Type Your Email for Activate',
          helperStyle: TextStyle(color: Colors.orange),
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        style: TextStyle(color: Colors.purple),
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.purple),
          helperText: 'Type Password',
          helperStyle: TextStyle(color: Colors.purple),
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Register'),
        actions: <Widget>[
          uploadButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
