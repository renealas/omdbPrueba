import 'package:flutter/material.dart';
import './screens/search_screen.dart';
import 'package:provider/provider.dart';

import './providers/peliculas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Peliculas(),
      child: MaterialApp(
        title: 'Flutter Excercise',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SearchScreen(),
      ),
    );
  }
}
