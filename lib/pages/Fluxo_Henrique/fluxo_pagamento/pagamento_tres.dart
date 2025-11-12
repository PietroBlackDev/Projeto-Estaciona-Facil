import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:estaciona_facil/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagamentoTres extends StatefulWidget {
  const PagamentoTres({
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
  State<PagamentoTres> createState() => _PagamentoTresState();
}

class _PagamentoTresState extends State<PagamentoTres> {
  final dio = Dio();

  String emailUsuario = box.read('email');

  void pagar(String emailUsuario) async {
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
        'http://10.0.0.94/Projeto-Estaciona-Facil-API/usuario/saldo/pagar/$emailUsuario',
        data: formData,
      );

      if (response.statusCode == 201) {
        print('Pagamento efetuado!');
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              const WidgetLabel(texto: "Confirmação"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      spacing: 20,
                      children: [
                        Text(
                          "${box.read('descricao')} ${box.read('placa_veiculo')}",
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

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  top: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 26),
                            Text(
                              'PIX Copia e Cola:',
                              style: Theme.of(context).textTheme.titleMedium,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.copy, size: 20),
                                  SizedBox(width: 5),
                                  Text(
                                    'Copiar',
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
                            SizedBox(height: 20),
                            Text(
                              'Código QR Code:',
                              style: Theme.of(context).textTheme.titleMedium,
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
                                  MediaQuery.of(context).size.height * 0.005,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
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
                        TextButton(
                          onPressed: () async {
                            pagar(emailUsuario);
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: myTheme.colorScheme.onPrimary,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Avançar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
