import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_textfield.dart';
import 'homepage_view.dart'; // ✅ import homepage

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / Placeholder
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // rounded corners
                  child: Image.asset(
                    "assets/images/loginLogo.png",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover, // fills the square nicely
                  ),
                ),
                const SizedBox(height: 40),

                // Title
                const Text(
                  "AURA Perfume Shop DVO 👑",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),

                // Subtitle
                const Text(
                  "A Scent That Stays",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: loginController.emailController,
                        label: "Email Address",
                        hint: "john.doe@gmail.com",
                        validator: (value) =>
                            loginController.validateEmail(value ?? ""),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: loginController.passwordController,
                        label: "Password",
                        hint: "Enter your password",
                        obscureText: true,
                        validator: (value) =>
                            loginController.validatePassword(value ?? ""),
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: loginController.isLoading.value
                                ? null
                                : () async {
                                    if (formKey.currentState!.validate()) {
                                      await loginController.login();

                                      // ✅ Check credentials here
                                      final email = loginController
                                          .emailController.text
                                          .trim();
                                      final password = loginController
                                          .passwordController.text
                                          .trim();

                                      if (email == "test123@gmail.com" &&
                                          password == "bscs123!") {
                                        Get.offAll(() =>  HomePageView());
                                      }
                                    }
                                  },
                            child: loginController.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
