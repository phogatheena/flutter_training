import 'package:ecommerce_app/components/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/cartpage.dart';
import 'package:ecommerce_app/shoppage.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedindex=0;

  void navigateBottomBar(int index)
  {
    setState(() {
      selectedindex=index;
    });

  }

  final List<Widget> pages =[
   const ShopPage(),
    const CartPage(),

  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: Builder(builder: (context)=>IconButton(icon:
         const Padding(
           padding:  EdgeInsets.only(left: 10.0),
           child:  Icon(Icons.menu,color: Colors.black,),
         ),
           onPressed: () {
             Scaffold.of(context).openDrawer();
           },),),
       ),
       drawer: Drawer(
         backgroundColor: Colors.grey[900],
         child: Column(
           children:
           [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerHeader(child: Image.asset('lib/images/a.png',color:Colors.white),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(color: Colors.grey[800],),
                ),

                const Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home',style: TextStyle(color:Colors.white),),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About',style: TextStyle(color:Colors.white),),
                  ),
                ),
              ],
            ),
             const Padding(
               padding: const EdgeInsets.only(left: 15.0,bottom: 15),
               child: ListTile(
                 leading: Icon(Icons.logout),
                 title: Text('Logout',style: TextStyle(color:Colors.white),),
               ),
             )

           ],
         ),
       ),
       body: pages[selectedindex],

    );
  }
}

