import 'package:estaciona_facil/components/widget_label.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alarmes extends StatefulWidget {
  const Alarmes({super.key});

  @override
  State<Alarmes> createState() => _AlarmesState();
}

String groupValue = 'Yes';
String groupValueDois = 'Yes';

class _AlarmesState extends State<Alarmes> {
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
              WidgetLabel(texto: 'Alarmes'),
              const SizedBox(height: 30),
              Text(
                'Quando ativar o alarme?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: "Now",
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            },
                          ),
                          Text(
                            "Na hora em que o cartão expirar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: "5min",
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            },
                          ),
                          Text(
                            "5 minutos antes de expirar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: "10min",
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            },
                          ),
                          Text(
                            "10 minutos antes de expirar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: "30min",
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            },
                          ),
                          Text(
                            "30 minutos antes de expirar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.003,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Qual a duração do som do alarme?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "Curta",
                          activeColor: Theme.of(context).colorScheme.secondary,
                          groupValue: groupValueDois,
                          onChanged: (value) {
                            setState(() {
                              groupValueDois = value!;
                            });
                          },
                        ),
                        Text(
                          "Curta",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "Media",
                          activeColor: Theme.of(context).colorScheme.secondary,
                          groupValue: groupValueDois,
                          onChanged: (value) {
                            setState(() {
                              groupValueDois = value!;
                            });
                          },
                        ),
                        Text(
                          "Média (padrão)",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "Longa",
                          activeColor: Theme.of(context).colorScheme.secondary,
                          groupValue: groupValueDois,
                          onChanged: (value) {
                            setState(() {
                              groupValueDois = value!;
                            });
                          },
                        ),
                        Text(
                          "Longa",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ],
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
    );
  }
}
