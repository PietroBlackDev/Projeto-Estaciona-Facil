
import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Joao/cadastro_tres.dart';
import 'package:flutter/material.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_voltar.dart';

class CadastroDois extends StatefulWidget {
  const CadastroDois({super.key});

  @override
  State<CadastroDois> createState() => _CadastroDoisState();
}

class _CadastroDoisState extends State<CadastroDois> {

  var formKey = GlobalKey<FormState>();
  var inputSenha = TextEditingController();

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
                  child:LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: 0.250,
                    backgroundColor: Colors.grey[300],
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                              '2 de 8',
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
        
                
                Column(
                      children: [
                    
                    Form(
                      key: formKey,
                      child: Center(
                        child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Informe o seu e-mail: ',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                    
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Por favor preencha seu e-mail!';
                                  }
                                  return null;
                                },
                                controller: inputSenha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.onPrimary, // mesma cor da borda ao focar
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                    
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 90),
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
                          if(formKey.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CadastroTres()),
                          );
                          }
                        },
                        child: Text(
                          "Avançar",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    
                      ],
                ),
        
                const SizedBox(height: 20,),
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