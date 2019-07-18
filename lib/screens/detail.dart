import 'package:flutter/material.dart';
import 'package:jai_app/models/food_model.dart';

class Detail extends StatefulWidget {

  final FoodModel foodModel;
  Detail({Key key, this.foodModel}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  FoodModel foodModel;

  @override
  void initState() { 
    super.initState();
    foodModel = widget.foodModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: Text('${foodModel.nameFood}'),
    );
  }
}
