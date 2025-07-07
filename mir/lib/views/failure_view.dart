import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  final String message;

  const FailedView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("❌ Error: $message")));
  }
}
