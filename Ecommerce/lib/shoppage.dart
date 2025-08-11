import 'package:ecommerce_app/components/shoetile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe)
  {
    Provider.of<Cart>(context,listen:false).addItemToCart(shoe);
    
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Successfully added to Cart!'),
      content: Text('Check your Cart'),
    ),
    );
  }

  


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text('Search',style: TextStyle(color: Colors.grey),),
              Icon(Icons.search,
                color: Colors.grey,
              ),
            ],
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Text('everyone flies..some fly longer than others'),
        ),

        Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:const [
              Text('Hot Picks 🔥',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              Text('See all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue
              ),)
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(child: ListView.builder
          (itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder:(content,index)
            {
              Shoe shoe = value.getShoeList()[index];
              return ShoeTile(
                shoe:shoe,
                onTap: ()=>addShoeToCart(shoe),
              );

            }
        )
        ),
        const Padding(
          padding: const EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    ),
    );

  }
}
