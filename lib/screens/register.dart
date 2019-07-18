import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jai_app/screens/my_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  String nameEn = 'Name :';
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Name in Blank';
          }
        },
        onSaved: (String value) {
          nameString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type you@email.com';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
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
        validator: (String value) {
          if (value.length < 6) {
            return 'Password More 6 Charactor';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Upload');

        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          uploadToFirebase();
        }
      },
    );
  }

  Future<void> uploadToFirebase() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objResponse) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((objResponse) {
      String errorString = objResponse.message;
      print('Error = $errorString');
      myAlertDialog(errorString);
    });
  }

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = nameString;
      response.updateProfile(updateInfo);
      moveToService();
    });
  }

  void moveToService() {
    var myServiceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
  }

  Widget alertButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget alertMessage(String messageString) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: Image.asset('images/logo.png'),
          ),
          Text(messageString),
        ],
      ),
    );
  }

  void myAlertDialog(String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register Error'),
          content: alertMessage(messageString),
          actions: <Widget>[alertButton()],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
