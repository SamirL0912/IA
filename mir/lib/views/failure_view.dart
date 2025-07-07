import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  final String? message; // mensaje opcional para mostrar

  const FailedView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.redAccent, size: 80),
            const SizedBox(height: 16),
            Text(
              message ?? '¡Algo salió mal!',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // volver atrás
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Intentar de nuevo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
