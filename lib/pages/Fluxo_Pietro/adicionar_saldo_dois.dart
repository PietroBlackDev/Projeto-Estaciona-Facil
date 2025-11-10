import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/home.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AdicionarSaldoDois extends StatefulWidget {
  final double saldo;

  const AdicionarSaldoDois({super.key, required this.saldo});

  @override
  State<AdicionarSaldoDois> createState() => _AdicionarSaldoDoisState();
}

class _AdicionarSaldoDoisState extends State<AdicionarSaldoDois> {
  bool _clicado = false;
  final dio = Dio();

  String emailUsuario = box.read('email');

  void adicionarSaldo(String emailUsuario) async {
    final token = box.read('token');
    try {
      Loading.show(context, mensagem: 'Carregando dados...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
            
          },
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final formData = FormData.fromMap({'Valor_Saldo': widget.saldo});

      final response = await dio.post(
        'http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/usuario/saldo/$emailUsuario',
        data: formData,
      );

      if (response.statusCode == 201) {
        print('Saldo adicionado com sucesso!');
      }

      Loading.hide();
    } catch (e) {
      Loading.hide();
      print("Erro ao consultar usuário: $e");
    }
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
                                      'Saldo: R\$ ${box.read('saldo') ?? '0.00'}',
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
                              onPressed: () {
                                setState(() {
                                  _clicado = false;
                                });

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.all(15),
                                      backgroundColor: Colors.white,
                                      title: Center(
                                        child: Text('Informações do cartão'),
                                      ),
                                      actions: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.58,
                                          padding: EdgeInsets.only(top: 20),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.secondary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.8,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.12,
                                                child: Input(
                                                  visibilidade: false,
                                                  label:
                                                      'Número titular do cartão:',
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.8,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.12,
                                                child: Input(
                                                  visibilidade: false,
                                                  label:
                                                      'Número cartão de crédito:',
                                                ),
                                              ),
                                              Row(
                                                spacing: 35,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width *
                                                        0.4,
                                                    height:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.height *
                                                        0.13,
                                                    child: Input(
                                                      visibilidade: false,
                                                      label:
                                                          'Validade (mm/aa):',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width *
                                                        0.3,
                                                    height:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.height *
                                                        0.13,
                                                    child: Input(
                                                      visibilidade: false,
                                                      label: 'CVV:',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 25),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.8,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.07,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    adicionarSaldo(
                                                      emailUsuario,
                                                    );
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          title: Center(
                                                            child: Text(
                                                              'Alterações salvas com\n            sucesso!',
                                                            ),
                                                          ),
                                                          content: Lottie.asset(
                                                            'assets/lottie/confirmado.json',
                                                          ),
                                                          actions: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                    context,
                                                                  ).size.width *
                                                                  0.9,
                                                              height:
                                                                  MediaQuery.of(
                                                                        context,
                                                                      )
                                                                      .size
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          0,
                                                                        ),
                                                                  ),
                                                              child: ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Theme.of(
                                                                        context,
                                                                      ).colorScheme.secondary,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (
                                                                            context,
                                                                          ) =>
                                                                              Home(),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Text(
                                                                  "OK",
                                                                  style: TextStyle(
                                                                    color:
                                                                        const Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255,
                                                                        ),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text('Avançar'),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.8,
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.07,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                          Color(0xff932426),
                                                        ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancelar'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
