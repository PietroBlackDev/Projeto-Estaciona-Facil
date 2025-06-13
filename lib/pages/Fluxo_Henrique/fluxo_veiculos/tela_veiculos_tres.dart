import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_quatro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeiculosTres extends StatefulWidget {
  const VeiculosTres({super.key, required this.icone});

  final IconData icone;

  @override
  State<VeiculosTres> createState() => _VeiculosTresState();
}

class _VeiculosTresState extends State<VeiculosTres> {
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
                      height: MediaQuery.of(context).size.height * 0.6,
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
                          Column(
                            spacing: 20,
                            children: [
                              Text(
                                "1. Categoria do veículo: ",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 20,
                                children: [
                                  Icon(
                                    widget.icone,
                                    size: 50,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "ALTERAR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            spacing: 20,
                            children: [
                              Text(
                                "2. Qual é o padrão da placa do veículo?",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => VeiculosQuatro(
                                                icone: widget.icone,
                                                caminhoImagem:
                                                    'assets/images/placa_brasileira.png',
                                              ),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/placa_brasileira.png',
                                      scale: 2,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => VeiculosQuatro(
                                                icone: widget.icone,
                                                caminhoImagem:
                                                    'assets/images/placa_mercosul.png',
                                              ),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/images/placa_mercosul.png',
                                      scale: 2,
                                    ),
                                  ),
                                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
