import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/inicio.dart';
import 'package:estaciona_facil/themes/theme.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}
