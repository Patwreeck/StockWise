// lib/controllers/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../utils/toast_util.dart';
import '../config/credentials.dart'; // <-- new import

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  String? validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!email.contains('@')) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);

    if (emailError != null || passwordError != null) {
      ToastUtil.show(emailError ?? passwordError!, isError: true, icon: Icons.error);
      return;
    }

    isLoading.value = true;

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    final user = UserModel(email: email, password: password);

    // Accept either the previously hardcoded admin OR the new demo credentials
    final bool isAdmin =
        user.email == "admin@stockx.com" && user.password == "123456";

    final bool isDemo =
        user.email == DemoCredentials.demoEmail &&
        user.password == DemoCredentials.demoPassword;

    if (isAdmin || isDemo) {
      ToastUtil.show("Login successful!", icon: Icons.check_circle);
      // Example navigation to HomeView (optional)
      // Get.offAll(() => const HomeView());
    } else {
      ToastUtil.show("Invalid credentials", isError: true, icon: Icons.error);
    }

    isLoading.value = false;
  }
}
