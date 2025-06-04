import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ajuda extends StatefulWidget {
  const Ajuda({super.key});

  @override
  State<Ajuda> createState() => _AjudaState();
}

class _AjudaState extends State<Ajuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetLabel(texto: 'Central de Ajuda'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.222,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                Text(
                  'Central de atendimento ao Usuário',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        'Fale com a gente pelo e-mail:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'contato@estacionefacilsr.app',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 42, 42),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ou pelo telefone:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '(11)7070-7070',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 42, 42),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.342),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Estacione fácil São Roque',
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 42, 42),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                      ),
                    ),
                    Text(
                      'Versão 1.0.1, Lançada em 31/02/2026',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
