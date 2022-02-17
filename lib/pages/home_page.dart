import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? navigate, showUserPosts;

  const HomePage({
    Key? key,
    this.navigate,
    this.showUserPosts,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoBackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'HomePage',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: widget.navigate ??
                  () {
                    context.navigateNamedTo('/user/2');
                  },
              child: const Text('Navigate to user/2'),
            ),
            ElevatedButton(
              onPressed: widget.showUserPosts,
              child: const Text('Show user posts'),
            ),
          ],
        ),
      ),
    );
  }
}
