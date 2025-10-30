import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final List<Map<String, String>> historyData = [
    {
      'name': 'Admin',
      'action': 'Added new product',
      'code': '342232',
      'date': 'Sep. 23, 2025 04:00AM'
    },
    {
      'name': 'Staff #1',
      'action': 'Logged In',
      'code': '',
      'date': 'Sep. 23, 2025 04:00AM'
    },
    {
      'name': 'Staff #2',
      'action': 'Adjusted quantity',
      'code': '323293',
      'date': 'Sep. 23, 2025 04:00AM'
    },
    {
      'name': 'Staff #2',
      'action': 'Adjusted quantity',
      'code': '323293',
      'date': 'Sep. 23, 2025 04:00AM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "History",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 32, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20), // same as outstock_view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // Scrollable List
            Expanded(
              child: ListView.builder(
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  final item = historyData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // same internal spacing as outstock_view
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side (User + Date)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name']!,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item['date']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),

                        // Right side (Action + Code)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['action']!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            if (item['code']!.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                item['code']!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
