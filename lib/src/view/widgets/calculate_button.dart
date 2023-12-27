import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key? key,
    required this.canCalculate,
    required this.pesoController,
    required this.alturaController,
    required this.onPressed,
  }) : super(key: key);

  final bool canCalculate;
  final TextEditingController pesoController;
  final TextEditingController alturaController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: canCalculate ? onPressed : null,
                child: const Text('Calcular'),
              ),
              SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
            ],
          ),
        );
      },
    );
  }
}
