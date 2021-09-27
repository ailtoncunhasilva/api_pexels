import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:justa_challenge/app/provider/provider_images.dart';
import 'package:justa_challenge/app/provider/provider_search_images.dart';
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
        ChangeNotifierProvider(
          create: (_) => ProviderSearchImages(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Justa Challenge',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR'),
        ],
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
