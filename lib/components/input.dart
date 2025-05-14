import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.visibilidade,
    required this.label,
  });

  final bool visibilidade;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
        ),// espaço entre o label e o campo
        TextFormField(
          obscureText: visibilidade,
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
      ],
    );
  }
}
