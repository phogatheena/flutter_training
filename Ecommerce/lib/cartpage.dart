import 'package:ecommerce_app/components/cartitem.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/cart.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer <Cart> (builder: (context, value, child) => Padding(

      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('My Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context,index)
              {
                Shoe individualShoe = value.getUserCart()[index];
                return CartItem(shoe: individualShoe);
              }

          ),),
        ],
      ),
    ),
    );
  }
}
