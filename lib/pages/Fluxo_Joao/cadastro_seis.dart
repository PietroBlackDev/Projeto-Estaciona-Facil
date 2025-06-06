import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/botao_basico_pop.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

class CadastroSeis extends StatefulWidget {
  const CadastroSeis({super.key});

  @override
  State<CadastroSeis> createState() => _CadastroSeisState();
}

class _CadastroSeisState extends State<CadastroSeis> {
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
                    value: 0.750,
                    backgroundColor: Colors.grey[300],
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                              '6 de 8',
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
                      
                      const SizedBox(width: 15),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Input(visibilidade: true, label: 'Confirme sua Senha: ')
                  ),
        
        
                const SizedBox(height: 90),
                BotaoBasico(texto: 'Avançar', pagina: CadastroSeis()),
                const SizedBox(height: 20,),
                BotaoBasicoPop(texto: 'Voltar'),
        
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