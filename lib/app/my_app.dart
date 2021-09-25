import 'package:flutter/material.dart';
import 'package:justa_challenge/app/provider/provider_images.dart';
import 'package:provider/provider.dart';

import 'screens/base_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderImages(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.lightBlue[900],
        ),
        debugShowCheckedModeBanner: false,
        home: BaseScreen(),
      ),
    );
  }
}
