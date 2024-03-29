import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_save_animals/providers/animals.dart';
import 'package:app_save_animals/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Animals())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: const Color.fromARGB(255, 39, 35, 35),
          background: Colors.black,
        )),
        home: const MyHomePage(),
      ),
    );
  }
}
