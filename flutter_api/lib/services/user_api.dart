import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/model/user.dart';


class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'http://randomuser.me/api/?results=5';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    return users;
  }
}

