import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';

// 🆕 Import the other view pages
import 'outofstock_view.dart';
import 'lowstock_view.dart';
import 'history_view.dart';
import 'allproducts_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_rounded,
                  color: Colors.red, size: 48), // red alert icon
              const SizedBox(height: 16),
              const Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // close dialog
                      Get.offAllNamed("/login"); // NOT WORKING ~ TO CHECK 
                    },
                    child: const Text("Yes, I am sure",
                        style: TextStyle(color: Colors.white)),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black54),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () => Navigator.pop(context), // just close
                    child: const Text("❌",
                        style: TextStyle(color: Colors.black87)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.black),
                        onPressed: () {
                          _showLogoutDialog(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.person, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Grid of cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  // Out of Stock
                  GestureDetector(
                    onTap: () => Get.to(() => const OutOfStockView()),
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.outOfStock.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Out of stock",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                right: 12,
                                top: 12,
                                child: Icon(Icons.error, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ),

                  // Low Stock
                  GestureDetector(
                    onTap: () => Get.to(() => const LowStockView()),
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.lowStock.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Low stock",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                right: 12,
                                top: 12,
                                child: Icon(Icons.check_circle,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        )),
                  ),

                  // History
                  GestureDetector(
                    onTap: () => Get.to(() => const AllProductsView()),
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.totalItems.value.toString(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "History",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                right: 12,
                                top: 12,
                                child:
                                    Icon(Icons.flash_on, color: Colors.black),
                              ),
                            ],
                          ),
                        )),
                  ),

                  // All Products
                  GestureDetector(
                    onTap: () => Get.to(() => const HistoryView()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(Icons.list,
                                color: Colors.black, size: 48),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Last login
            Padding(
              padding: const EdgeInsets.all(12),
              child: Obx(() => Center(
                    child: Text(
                      "Last login, ${controller.lastLogin.value}",
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black87),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
