import 'package:flutter/material.dart';
import 'package:jai_app/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double myLenght = 160.0;
  double h1 = 48.0, h2 = 18.0;

  // Method
  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.green[700],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget singUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text('Sign Up'),
        onPressed: () {
          print('You Click Sign Up');

          // Create Route
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          signInButton(),
          mySizeBox(),
          singUpButton(),
        ],
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          labelStyle: TextStyle(
            color: Colors.green[900],
          ),
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(
            color: Colors.green[900],
          ),
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
      width: 4.0,
    );
  }

  Widget showLogo() {
    return Container(
      width: myLenght,
      height: myLenght,
      child: Image.asset(
        'images/logo.png',
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Jai App',
      style: TextStyle(
        fontSize: h1,
        color: Colors.green[900],
        fontWeight: FontWeight.bold,
        fontFamily: 'Hanalei',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green[200]],
            begin: Alignment.topLeft,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            emailText(),
            passwordText(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
