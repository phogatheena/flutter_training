import 'package:flutter/material.dart';
import 'package:ecommerce_app/homepage.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: Image.asset('lib/images/a.png',height: 250,width: 350,)),
              ),
              const SizedBox(height: 24,),
              //title
               const Text('Just Buy It',
                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),

          //subtitle 2
          const SizedBox(height: 24,),
              //subtitle
          const Text('Brand new sneakers and custom kicks made with premium quality',
                style: TextStyle(fontSize: 16,color: Colors.blueGrey),
              textAlign:TextAlign.center,),
              //3

              const SizedBox(height: 48,),
              GestureDetector(
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage(),)),
                child: Container(
                  width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Center(child: Text('Shop Now',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
