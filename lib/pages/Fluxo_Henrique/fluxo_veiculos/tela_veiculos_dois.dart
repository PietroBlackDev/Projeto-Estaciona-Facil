import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_tres.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              spacing: 20,
              children: [
                WidgetLabel(texto: "Novo Veículo"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.22,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Column(
                    spacing: 30,
                    children: [
                      Text(
                        "1. Qual categoria do veículo?",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.12,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff540F63),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_car_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Automóveis",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.12,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff540F63),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.motorcycle,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Motocicletas",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.12,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff540F63),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fire_truck,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Fretes e\ncaminhões",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.12,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff540F63),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_car_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Outros veículos",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BotaoBasico(texto: 'Avançar', pagina: VeiculosTres()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.222,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
