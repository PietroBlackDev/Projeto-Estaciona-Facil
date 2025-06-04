import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermosCondicoes extends StatefulWidget {
  const TermosCondicoes({super.key});

  @override
  State<TermosCondicoes> createState() => _TermosCondicoesState();
}

class _TermosCondicoesState extends State<TermosCondicoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetLabel(texto: 'Termos e Condições'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
