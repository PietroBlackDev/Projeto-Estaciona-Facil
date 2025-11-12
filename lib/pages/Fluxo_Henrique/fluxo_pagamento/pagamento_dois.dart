import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/home.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:estaciona_facil/themes/theme.dart';
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
  late String delimitador;
  late String dados;
  late List<String> partes;
  late String tempoSelecionado;

  final dio = Dio();

  String emailUsuario = box.read('email');

  @override
  void initState() {
    super.initState();
    delimitador = ' ';
    partes = widget.horas.split(delimitador);
    tempoSelecionado = partes[0];
  }

  void pagar(String emailUsuario) async {
    final token = box.read('token');
    print(tempoSelecionado);
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

      final formData = FormData.fromMap({
        'id_carrro': box.read('id_veiculo'),
        'Valor_Saldo': widget.saldo,
        'nome_carro': box.read('descricao'),
        'tempoSelecionado': tempoSelecionado,
      });

      final response = await dio.post(
        'http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/usuario/saldo/pagar/$emailUsuario',
        data: formData,
      );

      if (response.statusCode == 201) {
        setState(() {
          box.write(
            'saldo',
            box.read('saldo') - double.parse(widget.saldo.toString()),
          );
        });
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

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.58,
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Column(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                child: Input(
                                  visibilidade: false,
                                  label: 'Número titular do cartão:',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Input(
                                      visibilidade: false,
                                      label: 'Validade (mm/aa):',
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Input(
                                      visibilidade: false,
                                      label: 'CVV:',
                                    ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                        ),
                        TextButton(
                          onPressed: () async {
                            pagar(emailUsuario);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Ativação realizada com Sucesso!',
                                ),
                              ),
                            );
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const Home()),
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
                          height: MediaQuery.of(context).size.height * 0.2,
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
