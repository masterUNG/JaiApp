class FoodModel {

  // Field
  String id, nameFood, priceFood, imageFood;


  // Constructor
  FoodModel(this.id, this.nameFood, this.priceFood, this.imageFood);

  FoodModel.fromJSoN(Map<String, dynamic> parseJSON){
    id = parseJSON['id'];
    nameFood = parseJSON['NameFood'];
    priceFood = parseJSON['Price'];
    imageFood = parseJSON['ImagePath'];
  }

  
}