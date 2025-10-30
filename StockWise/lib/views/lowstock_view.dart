import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LowStockView extends StatefulWidget {
  const LowStockView({super.key});

  @override
  State<LowStockView> createState() => _LowStockViewState();
}

class _LowStockViewState extends State<LowStockView> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _allItems = [
    {'name': 'CK One', 'description': 'Product Description', 'qty': 4, 'id': '3239812'},
    {'name': 'Versace Eros EDP/EDT', 'description': 'Product Description', 'qty': 3492, 'id': '3239812'},
    {'name': 'Dior Sauvage', 'description': 'Product Description', 'qty': 7, 'id': '13223'},
    {'name': 'Chanel Bleu', 'description': 'Product Description', 'qty': 3, 'id': '88991'},
    {'name': 'CK One Shock', 'description': 'Product Description', 'qty': 5, 'id': '445566'},
    {'name': 'CK One', 'description': 'Product Description', 'qty': 4, 'id': '3239812'},
    {'name': 'Versace Eros EDP/EDT', 'description': 'Product Description', 'qty': 3492, 'id': '3239812'},
    {'name': 'Dior Sauvage', 'description': 'Product Description', 'qty': 7, 'id': '13223'},
    {'name': 'Chanel Bleu', 'description': 'Product Description', 'qty': 3, 'id': '88991'},
    {'name': 'CK One Shock', 'description': 'Product Description', 'qty': 5, 'id': '445566'},
    {'name': 'CK One', 'description': 'Product Description', 'qty': 4, 'id': '3239812'},
    {'name': 'Versace Eros EDP/EDT', 'description': 'Product Description', 'qty': 3492, 'id': '3239812'},
    {'name': 'Dior Sauvage', 'description': 'Product Description', 'qty': 7, 'id': '13223'},
    {'name': 'Chanel Bleu', 'description': 'Product Description', 'qty': 3, 'id': '88991'},
    {'name': 'CK One Shock', 'description': 'Product Description', 'qty': 5, 'id': '445566'},
    {'name': 'CK One', 'description': 'Product Description', 'qty': 4, 'id': '3239812'},
    {'name': 'Versace Eros EDP/EDT', 'description': 'Product Description', 'qty': 3492, 'id': '3239812'},
    {'name': 'Dior Sauvage', 'description': 'Product Description', 'qty': 7, 'id': '13223'},
    {'name': 'Chanel Bleu', 'description': 'Product Description', 'qty': 3, 'id': '88991'},
    {'name': 'CK One Shock', 'description': 'Product Description ', 'qty': 5, 'id': '445566'},
  ];

  List<Map<String, dynamic>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _onSearchChanged(String query) {
    final lower = query.toLowerCase();
    setState(() {
      _filteredItems = _allItems.where((item) {
        final name = item['name'].toString().toLowerCase();
        final id = item['id'].toString().toLowerCase();
        return name.contains(lower) || id.contains(lower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Low Stock"),
        leading: IconButton(icon: Icon(Icons.arrow_back, size: 32,),onPressed: () => Get.back() ,),
      ),
      body: Container(  
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade400),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
        
            // Item count
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${_filteredItems.length} items',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),
            ),
        
            // Scrollable List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image placeholder
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.image, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 12),
        
                        // Product Name and Description
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item['description'],
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
        
                        // Qty - CENTER SECTION
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Qty',
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
                              ),
                              Text(
                                '${item['qty']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
        
                        // Product ID - RIGHT SIDE
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Product ID',
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
                              ),
                              Text(
                                item['id'],
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
