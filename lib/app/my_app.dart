import 'package:flutter/material.dart';

import 'screens/base_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlue[900],
      ),
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
    );
  }
}
