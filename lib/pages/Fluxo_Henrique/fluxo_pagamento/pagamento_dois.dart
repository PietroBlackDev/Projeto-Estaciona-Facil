import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagamentoDois extends StatefulWidget {
  const PagamentoDois({
    super.key,
    required this.placa,
    required this.saldo,
    required this.horas,
    required this.pagamento,
  });

  final String placa;
  final double saldo;
  final String horas;
  final String pagamento;

  @override
  State<PagamentoDois> createState() => _PagamentoDoisState();
}

class _PagamentoDoisState extends State<PagamentoDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              spacing: 20,
              children: [
                WidgetLabel(texto: "Confirmação"),
                Column(
                  spacing: 20,
                  children: [
                    Text(
                      "Descrição do carro ${widget.placa}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            Column(
                              spacing: 20,
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  color: Colors.deepPurple,
                                  size: 40,
                                ),
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.deepPurple,
                                  size: 40,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 20,
                              children: [
                                Text(
                                  widget.horas,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  widget.saldo.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.17,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.deepPurple, width: 3),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          "Escolha uma forma de pagamento",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 2,
                                  children: [
                                    Icon(Icons.pix, size: 50),
                                    Text(
                                      'PIX',
                                      style: TextStyle(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 2,
                                  children: [
                                    Icon(Icons.credit_card_rounded, size: 50),
                                    Text(
                                      'Cartão',
                                      style: TextStyle(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.58,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                  ),
                  child: Column(
                    spacing: 5,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Input(
                          visibilidade: false,
                          label: 'Número titular do cartão:',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Input(
                          visibilidade: false,
                          label: 'Número cartão de crédito:',
                        ),
                      ),
                      Row(
                        spacing: 35,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: Input(
                              visibilidade: false,
                              label: 'Validade (mm/aa):',
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: Input(visibilidade: false, label: 'CVV:'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            Radio(
                              value: "3 Horas",
                              groupValue: "Horas",
                              onChanged: (value) {},
                            ),
                            Text("Salvar cartão"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff932426),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancelar'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BotaoBasico(texto: "Avançar", pagina: VeiculosUm()),
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
