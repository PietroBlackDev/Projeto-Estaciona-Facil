import 'package:estaciona_facil/components/modal_confirmacao.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

class MinhaContaDois extends StatefulWidget {
  const MinhaContaDois({super.key});

  @override
  State<MinhaContaDois> createState() => _MinhaContaDoisState();
}

class _MinhaContaDoisState extends State<MinhaContaDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetLabel(texto: 'Minha Conta'),
                const SizedBox(height: 35),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.005,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Alterar senha',
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
                          spacing: 29,
                          children: [
                            Icon(Icons.lock, color: Colors.black, size: 25),
                            Icon(Icons.lock, color: Colors.black, size: 25),
                            Icon(Icons.lock, color: Colors.black, size: 25),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Senha atual',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 42, 42, 42),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Arsenal',
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    13,
                                    0,
                                    13,
                                    0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        141,
                                        158,
                                        158,
                                        158,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nova senha',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 42, 42, 42),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Arsenal',
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    13,
                                    0,
                                    13,
                                    0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        141,
                                        158,
                                        158,
                                        158,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Confirme a nova senha',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 42, 42, 42),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Arsenal',
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    13,
                                    0,
                                    13,
                                    0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        141,
                                        158,
                                        158,
                                        158,
                                      ),
                                    ),
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
                const SizedBox(height: 60),
                ModalConfirmacao(texto: 'Salvar'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
