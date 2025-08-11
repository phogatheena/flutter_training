import 'package:flutter/material.dart';
class todo_app extends StatefulWidget {
  const todo_app({super.key});

  @override
  State<todo_app> createState() => _todo_appState();
}

class _todo_appState extends State<todo_app> {
  TextEditingController a = TextEditingController();
  String greetmess='';
  void greetuser()
  {
    setState(() {
      greetmess= 'hello${a.text}';
    });
    greetmess= 'hello${a.text}';
  }
    @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body: Center(
          child: Column(
            children: [
              Text(greetmess),
              TextField(
                controller: a,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:  'Type your name'
                ),
              ),
              ElevatedButton(
                  onPressed:  greetuser,
                  child: Text('Click'))
            ],
          ),
        ),

    );
  }
}
