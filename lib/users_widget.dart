import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing_application_complete/user_model.dart';
import 'package:testing_application_complete/user_repository.dart';

class UsersWidget extends StatefulWidget {
  Future<List<User>> futureUsers;

  UsersWidget({super.key, required this.futureUsers});

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter test')),
      body: FutureBuilder(
        future: widget.futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List<User> users = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
              itemCount: users.length,
            );
          } else {
            return Text('${snapshot.error}');
          }
        },
      ),
    );
  }
}
