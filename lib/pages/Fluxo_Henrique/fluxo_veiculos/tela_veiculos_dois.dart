import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

class VeiculosDois extends StatefulWidget {
  const VeiculosDois({super.key});

  @override
  State<VeiculosDois> createState() => _VeiculosDoisState();
}

class _VeiculosDoisState extends State<VeiculosDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            WidgetLabel(texto: "Novo Veículo"),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "1. Qual categoria do veículo?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Arsenal',
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
