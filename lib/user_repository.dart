import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_application_complete/user_model.dart';

class UserRepository {
  final http.Client client;
  UserRepository(this.client);

  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('Error ocurred');
  }

  Future<List<User>> getUsers() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      List<User> userslst = jsonList.map((e) => User.fromJsonList(e)).toList();
      print(userslst);
      return userslst;
    }
    throw Exception('Error ocurred');
  }
}
