import 'package:flutter/material.dart';

import './screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test 11111'),
        ),
        body: Container(
          child: LoginScreen(),
        ));
  }
}
