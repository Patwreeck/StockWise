import 'package:flutter/material.dart';

class LowStockView extends StatelessWidget {
  const LowStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Low Stock")),
      body: const Center(
        child: Text("This is the Low Stock Page"),
      ),
    );
  }
}
