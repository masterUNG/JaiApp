import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jai_app/models/food_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit

  // Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {

    String urlJSON = 'https://www.androidthai.in.th/ooo/getAllFood.php';

    var response = await http.get(urlJSON);
    var result = json.decode(response.body);
    // print('result = $result');

    for (var myParseJSON in result) {

      FoodModel foodModel = FoodModel.fromJSoN(myParseJSON);
      print('nameFood = ${foodModel.nameFood}');
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('This is Home'),
    );
  }
}
