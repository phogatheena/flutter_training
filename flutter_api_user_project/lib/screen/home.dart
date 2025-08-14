import 'package:api/model/user.dart';
import 'package:api/services/user_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  void initState()
  {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context,index) {
          final user = users[index];
          final email = user.email;
          //final color = user.gender== 'male'?Colors.blue:Colors.red;
        return ListTile(
          title: Text(user.fullName),
          subtitle: Text(user.location.country),
          //tileColor: color,
        );
      }),

    );
  }
  Future<void> fetchUsers() async
  {
    final response = await UserApi.fetchUsers();
    setState(() {
      users =response;
    });
  }


}
