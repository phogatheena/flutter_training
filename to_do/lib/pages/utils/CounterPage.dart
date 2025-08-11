import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You clicked the button this many times:'),
            Text(counter.toString()),
            ElevatedButton(onPressed: (){
                 incrementCounter();
            },
                child: Icon(Icons.add))
          ],
        ),
      )
    );
  }
}


