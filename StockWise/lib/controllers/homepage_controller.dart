import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Observable fields
  final outOfStock = 3.obs;
  final lowStock = 3.obs;
  final totalItems = 68.obs;
  final lastLogin = "Sep 17, 2025 at 8pm".obs;

  // Update methods
  void updateOutOfStock(int value) {
    outOfStock.value = value;
  }

  void updateLowStock(int value) {
    lowStock.value = value;
  }

  void updateTotalItems(int value) {
    totalItems.value = value;
  }

  void updateLastLogin(String value) {
    lastLogin.value = value;
  }

  // Reset all values if needed
  void resetDashboard() {
    outOfStock.value = 0;
    lowStock.value = 0;
    totalItems.value = 0;
    lastLogin.value = "No login yet";
  }
}
