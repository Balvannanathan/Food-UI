import 'package:food_ui/Services/CartService/ICartService.dart';

class CartService implements ICartSevice {
  @override
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    return [
      {
        "image": "item1.png",
        "name": "Veggie mix",
        "price": 200,
        "category": "Foods",
        "description": "Veggie tomato mix",
      },
      {
        "image": "item2.png",
        "name": "Chicken",
        "price": 250,
        "category": "Foods",
        "description": "Chicken with mint",
      },
      {
        "image": "item3.png",
        "name": "Spicy fish",
        "price": 600,
        "category": "Foods",
        "description": "Spicy fish sauce",
      },
      {
        "image": "item4.png",
        "name": "Moi-moi.",
        "price": 900,
        "category": "Foods",
        "description": "Moi-moi and ekpa.",
      },
      {
        "image": "item5.png",
        "name": "Chicken Fry",
        "price": 400,
        "category": "Foods",
        "description": "Fried chicken m.",
      },
      {
        "image": "item6.png",
        "name": "Coke",
        "price": 400,
        "category": "Drinks",
        "description": "Coke",
      },
      {
        "image": "item7.png",
        "name": "Fanta",
        "price": 400,
        "category": "Drinks",
        "description": "Fanta",
      },
      {
        "image": "item8.png",
        "name": "Sprite",
        "price": 400,
        "category": "Drinks",
        "description": "Sprite",
      },
      {
        "image": "item6.png",
        "name": "Pepsi",
        "price": 400,
        "category": "Drinks",
        "description": "Pepsi",
      },
      {
        "image": "item10.png",
        "name": "Water",
        "price": 30,
        "category": "Drinks",
        "description": "Water",
      },
      {
        "image": "item11.png",
        "name": "Biscuits",
        "price": 30,
        "category": "Snacks",
        "description": "Biscuits",
      },
      {
        "image": "item12.png",
        "name": "Cookies",
        "price": 30,
        "category": "Snacks",
        "description": "Cookies",
      },
      {
        "image": "item13.png",
        "name": "Sandwitch",
        "price": 30,
        "category": "Snacks",
        "description": "Sandwitch",
      },
      {
        "image": "item14.png",
        "name": "Burger",
        "price": 30,
        "category": "Snacks",
        "description": "Burger",
      },
      {
        "image": "item15.png",
        "name": "Fries",
        "price": 30,
        "category": "Snacks",
        "description": "Fries",
      },
    ];
  }
}
