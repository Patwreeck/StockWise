import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';

// Import the other view pages
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
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
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
                      Get.offAllNamed("/login"); // now this should work
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
            // 🔝 Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Optional black logo container
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

            // 🔲 Grid with 2 rows x 2 columns
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35), // match Trello padding
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Out of Stock card
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.to(() => const OutofstockView()),
                            child: Obx(() => Container(
                                  height: 150,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF2E63),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.outOfStock.value.toString(),
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 48,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "Out of stock",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),

                        // Low Stock card
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.to(() => const LowStockView()),
                            child: Obx(() => Container(
                                  height: 150,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF252A34),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.lowStock.value.toString(),
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 48,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "Low stock",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        // All Products card
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.to(() => const AllproductsView()),
                            child: Obx(() => Container(
                                  height: 150,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF08D9D6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.totalItems.value.toString(),
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 48,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "All products",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),

                        // History card
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Get.to(() => const HistoryView()),
                            child: Container(
                              height: 150,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Icon(Icons.list,
                                    color: Colors.black, size: 48),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ⏱ Last login
            Padding(
              padding: const EdgeInsets.all(12),
              child: Obx(() => Center(
                    child: Text(
                      "Last login, ${controller.lastLogin.value}",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
