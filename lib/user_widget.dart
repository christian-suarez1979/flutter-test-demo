import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing_application_complete/user_model.dart';
import 'package:testing_application_complete/user_repository.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  Future<User> getUsers = UserRepository(Client()).getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter test')),
      body: FutureBuilder(
        future: getUsers,
        builder: (context, snapwhot) {
          if (snapwhot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text('${snapwhot.data!.name}'),
          );
        },
      ),
    );
  }
}
