import 'package:estaciona_facil/themes/theme.dart';
import 'package:flutter/material.dart';

import 'pages/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Home'),
    );
  }
}
