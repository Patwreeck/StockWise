import 'package:flutter/material.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: const Center(
        child: Text("This is the All Products Page"),
      ),
    );
  }
}
