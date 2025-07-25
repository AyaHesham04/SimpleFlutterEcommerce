import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final Map<String, dynamic> data;

  const ItemsDetails({super.key, required this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  int selectedBottomNavIndex = 0;
  String selectedColor = "";
  String selectedSize = "";
  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    if ((widget.data["colors"] ?? []).isNotEmpty) {
      selectedColor = widget.data["colors"][0];
    }
    if ((widget.data["sizes"] ?? []).isNotEmpty) {
      selectedSize = widget.data["sizes"][0];
    }
  }

  void onBottomNavTapped(int index) {
    setState(() => selectedBottomNavIndex = index);
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        _showSnack('Shopping cart feature coming soon!');
        break;
      case 2:
        _showSnack('Profile feature coming soon!');
        break;
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 1)),
    );
  }

  Color getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black': return Colors.black;
      case 'white': return Colors.white;
      case 'grey': case 'gray': return Colors.grey;
      case 'blue': return Colors.blue;
      case 'silver': return Colors.grey[400]!;
      case 'natural titanium': return Colors.grey[300]!;
      case 'blue titanium': return Colors.blue[200]!;
      case 'white titanium': return Colors.grey[100]!;
      case 'black titanium': return Colors.grey[800]!;
      case 'space gray': return Colors.grey[700]!;
      default: return Colors.grey;
    }
  }

  Widget _fallbackImage() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
            SizedBox(height: 10),
            Text('Image not available', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.data["colors"] ?? [];
    final sizes = widget.data["sizes"] ?? [];
    final features = widget.data["features"] ?? [];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedBottomNavIndex,
          onTap: onBottomNavTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ],
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.devices, color: Colors.orange),
              Text(" Devices ", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
              Text("Store", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[50],
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.grey[700]),
          actions: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() => isFavorite = !isFavorite);
                _showSnack(isFavorite ? 'Added to favorites!' : 'Removed from favorites!');
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            // Product image
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[100],
              child: widget.data["image"] != null
                  ? Image.asset(
                widget.data["image"],
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => _fallbackImage(),
              )
                  : _fallbackImage(),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.data["brand"] != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.data["brand"],
                            style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      if (widget.data["rating"] != null)
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              "${widget.data["rating"]} (${widget.data["reviews"] ?? 0} reviews)",
                              style: TextStyle(color: Colors.grey[600], fontSize: 14),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Product Title
                  Text(
                    widget.data["title"] ?? "Unnamed Product",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87),
                  ),

                  const SizedBox(height: 10),

                  // Product Description
                  Text(
                    widget.data["description"] ?? "",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  // Price section
                  Row(
                    children: [
                      Text(
                        widget.data["price"] ?? "N/A",
                        style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      if (widget.data["originalPrice"] != null) ...[
                        const SizedBox(width: 10),
                        Text(
                          widget.data["originalPrice"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                      if (widget.data["discount"] != null) ...[
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Save ${widget.data["discount"]}",
                            style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Stock status
                  Row(
                    children: [
                      Icon(
                        widget.data["inStock"] == true ? Icons.check_circle : Icons.cancel,
                        color: widget.data["inStock"] == true ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.data["inStock"] == true ? "In Stock" : "Out of Stock",
                        style: TextStyle(
                          color: widget.data["inStock"] == true ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Color Selection
                  if (colors.isNotEmpty) ...[
                    const Text("Color:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: colors.map<Widget>((color) {
                          bool isSelected = selectedColor == color;
                          return GestureDetector(
                            onTap: () => setState(() => selectedColor = color),
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: getColorFromString(color),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected ? Colors.orange : Colors.grey[300]!,
                                        width: isSelected ? 3 : 1,
                                      ),
                                      boxShadow: isSelected
                                          ? [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 5)]
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    color,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSelected ? Colors.orange : Colors.grey[600],
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],

                  // Size Selection
                  if (sizes.isNotEmpty) ...[
                    const Text("Size:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: sizes.map<Widget>((size) {
                          bool isSelected = selectedSize == size;
                          return GestureDetector(
                            onTap: () => setState(() => selectedSize = size),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.orange : Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? Colors.orange : Colors.grey[300]!,
                                ),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.grey[700],
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],

                  // Features
                  if (features.isNotEmpty) ...[
                    const Text("Key Features:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 15),
                    Column(
                      children: features.map<Widget>((feature) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.green, size: 20),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(feature, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 25),
                  ],

                  // Quantity
                  const Text("Quantity:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                              icon: const Icon(Icons.remove),
                              color: quantity > 1 ? Colors.orange : Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(quantity.toString(),
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            IconButton(
                              onPressed: () => setState(() => quantity++),
                              icon: const Icon(Icons.add),
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: widget.data["inStock"] == true
                              ? () => _showSnack('Added to cart: ${widget.data["title"]} x$quantity')
                              : null,
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                          label: const Text('Add To Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.data["inStock"] == true ? Colors.orange : Colors.grey,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () => _showSnack('Share feature coming soon!'),
                          icon: const Icon(Icons.share, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Buy Now
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: widget.data["inStock"] == true
                          ? () => _showPurchaseDialog()
                          : null,
                      child: const Text('Buy Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.data["inStock"] == true ? Colors.black : Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Purchase Confirmation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product: ${widget.data["title"]}'),
            if (selectedColor.isNotEmpty) Text('Color: $selectedColor'),
            if (selectedSize.isNotEmpty) Text('Size: $selectedSize'),
            Text('Quantity: $quantity'),
            const SizedBox(height: 10),
            Text('Total: ${widget.data["price"]}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnack('Purchase successful! Order processing...');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Confirm Purchase', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
