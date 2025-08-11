import 'package:flutter/material.dart';
import 'package:hii/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellowAccent,
     content: SizedBox(
       height: 120,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           TextField(
             controller: controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'Add a new text'
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                MyButton(text: 'Save',
                    onPressed: onSave),
               const SizedBox(width: 10,),
               MyButton(text: 'Cancel',
                   onPressed: onCancel)
             ],
           )
         ],
       ),
     ),
    );
  }
}
