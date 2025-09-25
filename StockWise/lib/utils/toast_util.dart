import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtil {
  static void show(String message, {bool isError = false, IconData? icon}) {
    Get.rawSnackbar(
      backgroundColor: Colors.transparent, // fully transparent snackbar
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM, // still required, but we override
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      borderRadius: 0,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      messageText: Align(
        alignment: Alignment.center, // <-- centers the toast
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          constraints: const BoxConstraints(
            minWidth: 200,
            maxWidth: 280, // fixed toast size
          ),
          decoration: BoxDecoration(
            color: isError ? Colors.redAccent : Colors.greenAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? (isError ? Icons.error : Icons.check_circle),
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
