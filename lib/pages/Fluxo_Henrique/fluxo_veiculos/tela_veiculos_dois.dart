import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_tres.dart';
import 'package:flutter/material.dart';

class VeiculosDois extends StatefulWidget {
  const VeiculosDois({super.key});

  @override
  State<VeiculosDois> createState() => _VeiculosDoisState();
}

class _VeiculosDoisState extends State<VeiculosDois> {
  late final IconData valorIcone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              const WidgetLabel(texto: "Novo Veículo"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
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
                            spacing: 30,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xff540F63),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => VeiculosTres(
                                                  icone:
                                                      Icons
                                                          .directions_car_rounded,
                                                ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.directions_car_rounded,
                                        color: Colors.white,
                                      ),
                                      iconSize: 50,
                                    ),
                                    Text(
                                      "Automóveis",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xff540F63),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => VeiculosTres(
                                                  icone: Icons.motorcycle,
                                                ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.motorcycle,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      "Motocicletas",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 30,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xff540F63),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => VeiculosTres(
                                                  icone: Icons.fire_truck,
                                                ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.fire_truck,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      "Fretes e\ncaminhões",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xff540F63),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => VeiculosTres(
                                                  icone:
                                                      Icons
                                                          .directions_car_rounded,
                                                ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.directions_car_rounded,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      "Outros veículos",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.17,
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
              ),

              // BotaoBasico(
              //   texto: 'Avançar',
              //   pagina: VeiculosTres(icone: Icons.abc_outlined),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
