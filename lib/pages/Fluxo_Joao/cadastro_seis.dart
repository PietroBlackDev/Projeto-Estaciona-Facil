// lib/pages/Fluxo_Manu/cadastro/cadastro_seis.dart

import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/modal_cadastro.dart'; // Importa a função showConfirmationModal
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_voltar.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/termos_condicoes.dart';
import 'package:flutter/material.dart';

class CadastroSeis extends StatefulWidget {
  const CadastroSeis({super.key});

  @override
  State<CadastroSeis> createState() => _CadastroSeisState();
}

class _CadastroSeisState extends State<CadastroSeis> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetLabel(texto: 'CADASTRO'),
                const SizedBox(height: 20),

                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.025,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: 1.00,
                    backgroundColor: Colors.grey[300],
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                const Text( // Adicionado 'const' aqui
                  '6 de 6',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Arsenal',
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Removido o 'spacing' aqui, pois não é propriedade direta de Column/Row.
                      // Se necessário, use SizedBox entre os children.
                      const SizedBox(width: 15),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Adicionado SizedBox para espaçamento entre os elementos se houver.
                            // Originalmente tinha 'spacing: 20' aqui, que não é um argumento de Column.
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Aceite os Termos e condições de uso selecionando o quadrado abaixo: '),
                ),

                const SizedBox(height: 5),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          hoverColor: Theme.of(context).colorScheme.secondary,
                          checkColor: Colors.white,
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue ?? false;
                            });
                          },
                        ),
                      ),
                      const Text('Eu Aceito os Termos de Uso e Condições')
                    ],
                  ),
                ),


                const SizedBox(height: 70),
                BotaoBasico(texto: 'Termos e Condições', pagina: TermosCondicoes()),
                const SizedBox(height: 15,),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if(_isChecked == true){
                        // CHAMA O MODAL DE SUCESSO AQUI!
                        showConfirmationModal(context);
                      } else {
                        // Mostra o BottomSheet de erro se o checkbox não estiver marcado
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                // Ajustado para usar SizedBox para espaçamento, pois 'spacing' não é propriedade de Column
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Theme.of(context).colorScheme.surface,
                                    size: 60,
                                  ),
                                  const SizedBox(height: 10), // Adicionado espaçamento
                                  Text(
                                    'Aceite para continuar!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Concluir",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                BotaoVoltar(texto: 'Voltar'),

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
