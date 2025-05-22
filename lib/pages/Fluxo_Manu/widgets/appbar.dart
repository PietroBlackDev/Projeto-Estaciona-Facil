import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 50),
            Text(
              texto,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
