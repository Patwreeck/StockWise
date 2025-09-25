import 'package:flutter/material.dart';

class OutOfStockView extends StatelessWidget {
  const OutOfStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Out of Stock")),
      body: const Center(
        child: Text("This is the Out of Stock Page"),
      ),
    );
  }
}
