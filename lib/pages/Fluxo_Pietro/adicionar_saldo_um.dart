import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/adicionar_saldo_dois.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionarSaldoUm extends StatefulWidget {
  const AdicionarSaldoUm({super.key});

  @override
  State<AdicionarSaldoUm> createState() => _AdicionarSaldoUmState();
}

class _AdicionarSaldoUmState extends State<AdicionarSaldoUm> {
  double saldo = 0;
  void atualizarSaldo(double valor) {
    setState(() {
      saldo += valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetLabel(texto: 'Adicionar Saldos'),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 4,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Saldo: R\$ 0,00',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Text(
                '1. Valor que deseja comprar?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        spacing: 15,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(5.00);
                              },
                              child: Text(
                                'R\$ 5,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(10.00);
                              },
                              child: Text(
                                'R\$ 10,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(20.00);
                              },
                              child: Text(
                                'R\$ 20,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                    Center(
                      child: Column(
                        spacing: 15,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(50.00);
                              },
                              child: Text(
                                'R\$ 50,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(100.00);
                              },
                              child: Text(
                                'R\$ 100,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                atualizarSaldo(200.00);
                              },
                              child: Text(
                                'R\$ 200,00',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Total: R\$ ${saldo.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 26),
              BotaoBasico(
                texto: 'Avançar',
                pagina: AdicionarSaldoDois(saldo: saldo),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.21,
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
    );
  }
}
