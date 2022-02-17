import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UserPostsPage extends StatefulWidget {
  const UserPostsPage({Key? key}) : super(key: key);

  @override
  _UserPostsPageState createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'User Posts',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (_) => const AlertDialog(
                      title: Text('Alert'),
                    ),
                  );
                },
                child: const Text('Show Dialog')),
            const Expanded(
              child: AutoRouter(),
            )
          ],
        ),
      ),
    );
  }
}
