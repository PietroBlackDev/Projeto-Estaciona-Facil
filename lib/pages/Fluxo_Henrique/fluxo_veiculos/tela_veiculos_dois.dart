import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:flutter/material.dart';

class VeiculosDois extends StatefulWidget {
  const VeiculosDois({super.key});

  @override
  State<VeiculosDois> createState() => _VeiculosDoisState();
}

class _VeiculosDoisState extends State<VeiculosDois> {
  late final IconData valorIcone;
  final TextEditingController _controllerCategoria = TextEditingController();
  final TextEditingController _controllerPadraoPlaca = TextEditingController();
  final TextEditingController _controllerPlaca = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();
  late String padraoPlaca = '';
  final _formKey = GlobalKey<FormState>();

  void cadastrarVeiculo() async {
    try {
      final token = box.read('token');
      Loading.show(context, mensagem: 'Cadastrando...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          validateStatus: (status) => status! < 500,
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final dados = FormData.fromMap({
        'categoria': _controllerCategoria.text,
        'padrao_placa': _controllerPadraoPlaca.text,
        'placa': _controllerPlaca.text,
        'nome_carro': _controllerDescricao.text,
        'id_usuario': box.read('id_usuario'),
      });

      final response = await dio.post(
        'http://10.0.0.94/Projeto-Estaciona-Facil-API/veiculos',
        data: dados,
      );

      if (response.statusCode == 201) {
        Loading.hide();
        Navigator.pop(context, true);
        setState(() {});
      } else {
        Loading.hide();
      }
    } catch (e) {
      print(e);
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
              const WidgetLabel(texto: "Novo Veículo"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 30,
                        children: [
                          Text(
                            "1. Categoria do Veículo",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            controller: _controllerCategoria,
                            decoration: InputDecoration(
                              labelText: '(ex: Automóvel, Motocicleta)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira a categoria do veículo';
                              }
                              return null;
                            },
                          ),

                          Text(
                            "2. Padrão da placa do veículo",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            controller: _controllerPadraoPlaca,
                            decoration: InputDecoration(
                              labelText: '(ex: Mercosul, Antigo)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira o padrão da placa do veículo';
                              }
                              return null;
                            },
                          ),

                          Text(
                            "3. Placa do veículo",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            controller: _controllerPlaca,
                            decoration: InputDecoration(
                              labelText: '(ex: ABC1D23)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira a placa do veículo';
                              }
                              return null;
                            },
                          ),

                          Text(
                            "4. Descrição do veículo",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            controller: _controllerDescricao,
                            decoration: InputDecoration(
                              labelText: '(ex: Fiat Branco)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira a descrição do veículo';
                              }
                              return null;
                            },
                          ),

                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                cadastrarVeiculo();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 50,
                              ),
                              child: Text("Cadastrar Veículo"),
                            ),
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
