import 'package:flutter/material.dart';


// This is your All Products Page
class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsView> {
  // Dummy data to display in the product list
  List<Map<String, dynamic>> products = [
    {"name": "CK One", "description": "Product Description", "qty": 4, "id": "3239812"},
    {"name": "Versace Eros EDP/EDT", "description": "Product Description", "qty": 3492, "id": "3239812"},
    {"name": "CK One", "description": "Product Description", "qty": 4, "id": "3239812"},
    {"name": "Versace Eros EDP/EDT", "description": "Product Description", "qty": 3492, "id": "3239812"},
    {"name": "CK One", "description": "Product Description", "qty": 4, "id": "3239812"},
  ];

  // This will store the filtered list based on search
  List<Map<String, dynamic>> filteredProducts = [];

  // Controller for the search text field
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Show all products initially
  }

  // Function that filters products based on search input
  void filterSearch(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        // Convert both query and fields to lowercase for case-insensitive matching
        final name = product['name'].toString().toLowerCase();
        final id = product['id'].toString().toLowerCase();
        final q = query.toLowerCase();
        return name.contains(q) || id.contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar fixed on top (won’t scroll away)
      appBar: AppBar(
        automaticallyImplyLeading: false, // remove default back button
        title: const Text(
          "All Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // Add button on the right
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                // Action when Add is clicked
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Add button clicked")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        leading: IconButton(
          // Back button to go back to the home page
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigates back to previous screen
          },
        ),
      ),

      // The body contains a column with search bar and product list
      body: Column(
        children: [
          // Search bar section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearch, // Real-time search
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // Item count text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${filteredProducts.length} items",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),

          // Expanded widget makes the ListView scrollable
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  // Product image (placeholder)
                  leading: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, color: Colors.black),
                  ),

                  // Product name and description
                  title: Text(product['name']),
                  subtitle: Text(product['description']),

                  // Product quantity and ID
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Qty: ${product['qty']}"),
                      Text(
                        "Product ID: ${product['id']}",
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
