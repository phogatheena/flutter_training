import 'package:flutter/material.dart';

import 'shoe.dart';
class Cart extends ChangeNotifier{
List<Shoe> shoeShop =[
  Shoe(name: 'Zoom Freak',
      price: '2360',
      imagePath: 'lib/images/b.png',
      description: 'The forward thinking design of his latest signature shoe'
  ),

  Shoe(
    name: 'Air Max Pro',
    price: '2999',
    imagePath: 'lib/images/c.png',
    description: 'Experience unmatched comfort with a sporty edge',
  ),

  Shoe(
    name: 'Court Vision',
    price: '2150',
    imagePath: 'lib/images/d.png',
    description: 'Classic design meets modern performance on the court',
  ),

  Shoe(
    name: 'Revolution 6',
    price: '1800',
    imagePath: 'lib/images/e.png',
    description: 'Lightweight, durable and perfect for daily runs',
  ),
];
List<Shoe> userCart=[];
List <Shoe> getShoeList(){
  return shoeShop;
}
List<Shoe> getUserCart()
{
  return userCart;
}

void addItemToCart(Shoe shoe)
{
  userCart.add(shoe);
  notifyListeners();
}
void removeItemFromCart(Shoe shoe)
{
  userCart.remove(shoe);
  notifyListeners();
}
}