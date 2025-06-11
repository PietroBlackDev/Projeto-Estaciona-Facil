import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionarSaldoDois extends StatefulWidget {
  final double saldo;

  const AdicionarSaldoDois({super.key, required this.saldo});

  @override
  State<AdicionarSaldoDois> createState() => _AdicionarSaldoDoisState();
}

class _AdicionarSaldoDoisState extends State<AdicionarSaldoDois> {
  bool _clicado = false;

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
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.84,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Saldo: R\$ 0,00',
                                      style: TextStyle(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
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
                        '1. Créditos a comprar:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Text(
                                  'Total valor escolhido:',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),

                                Text(
                                  'R\$ ${widget.saldo.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.27,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'ALTERAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        '2. Qual a forma de pagamento?',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 40,
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
                                          Theme.of(context).colorScheme.primary,
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
                                          Theme.of(context).colorScheme.primary,
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
                      const SizedBox(height: 40),

                      _clicado
                          ? Padding(
                            padding: const EdgeInsets.only(right: 41, left: 41),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height *
                                      0.005,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                const SizedBox(height: 26),
                                Text(
                                  'PIX Copia e Cola:',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '00020101021126640014BR.GOV.BCB.PIX0114c2b0f8-3d1e-4a5b-9c6f-7d8e2f1a2b3c520400005303986540testesaoroqueKDJGW23testeFacyukdad2345523',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Código PIX copiado com sucesso!',
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.copy, size: 20),
                                      SizedBox(width: 5),
                                      Text(
                                        'Copiar',
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
                                SizedBox(height: 20),
                                Text(
                                  'Código QR Code:',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Image.asset(
                                    'assets/images/codigo_qr.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                const SizedBox(height: 26),

                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height *
                                      0.005,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.07,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Color(0xff932426),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _clicado = false;
                                        });
                                      },
                                      child: Text('Cancelar'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _clicado = true;
                                });
                              },
                              child: Text('Avançar'),
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
