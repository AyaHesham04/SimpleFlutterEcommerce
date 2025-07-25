import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/details.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedBottomNavIndex = 0;

  List categories = [
    {
      "iconName": Icons.laptop,
      "title": "Laptop"
    },
    {
      "iconName": Icons.phone_android,
      "title": "Mobile"
    },
    {
      "iconName": Icons.tv,
      "title": "TV"
    },
    {
      "iconName": Icons.headphones,
      "title": "Headphones"
    },
    {
      "iconName": Icons.desktop_windows_outlined,
      "title": "Desktops"
    },
    {
      "iconName": Icons.keyboard,
      "title": "Keyboards"
    },
    {
      "iconName": Icons.mouse_outlined,
      "title": "Mouse"
    },
  ];

  // Enhanced product data as if coming from backend
  List bestSelling = [
    {
      "id": 1,
      "image": "images/desktop.png",
      "title": "Gaming Desktop PC",
      "description": "High-performance desktop with Intel i7 processor, 16GB RAM, and RTX 3070 graphics card",
      "price": "13500 LE",
      "originalPrice": "15000 LE",
      "discount": "10%",
      "rating": 4.5,
      "reviews": 324,
      "inStock": true,
      "colors": ["Black", "White"],
      "sizes": ["Standard", "Compact"],
      "category": "Desktop",
      "brand": "TechPro",
      "features": ["Intel i7", "16GB RAM", "RTX 3070", "1TB SSD"]
    },
    {
      "id": 2,
      "image": "images/headphones.png",
      "title": "Wireless Noise-Cancelling Headphones",
      "description": "Premium wireless headphones with active noise cancellation and 30-hour battery life",
      "price": "3500 LE",
      "originalPrice": "4000 LE",
      "discount": "12%",
      "rating": 4.8,
      "reviews": 1250,
      "inStock": true,
      "colors": ["Black", "Silver", "Blue"],
      "sizes": ["One Size"],
      "category": "Headphones",
      "brand": "AudioMax",
      "features": ["Noise Cancelling", "30h Battery", "Bluetooth 5.0", "Quick Charge"]
    },
    {
      "id": 3,
      "image": "images/tv.png",
      "title": "55\" 4K Smart TV",
      "description": "Ultra HD Smart TV with HDR support, built-in streaming apps, and voice control",
      "price": "23000 LE",
      "originalPrice": "26000 LE",
      "discount": "15%",
      "rating": 4.3,
      "reviews": 892,
      "inStock": true,
      "colors": ["Black"],
      "sizes": ["55 inch", "65 inch", "75 inch"],
      "category": "TV",
      "brand": "LG",
      "features": ["4K Ultra HD", "HDR10", "Smart OS", "Voice Control"]
    },
    {
      "id": 4,
      "image": "images/mobile.png",
      "title": "iPhone 15 Pro",
      "description": "Latest iPhone with A17 Pro chip, titanium design, and advanced camera system",
      "price": "60000 LE",
      "originalPrice": "65000 LE",
      "discount": "8%",
      "rating": 4.7,
      "reviews": 2156,
      "inStock": true,
      "colors": ["Natural Titanium", "Blue Titanium", "White Titanium", "Black Titanium"],
      "sizes": ["128GB", "256GB", "512GB", "1TB"],
      "category": "Mobile",
      "brand": "Apple",
      "features": ["A17 Pro Chip", "Titanium Design", "48MP Camera", "5G Ready"]
    },
    {
      "id": 5,
      "image": "images/laptop.png",
      "title": "MacBook Pro 16\"",
      "description": "Professional laptop with M3 Max chip, 32GB unified memory, and Liquid Retina XDR display",
      "price": "85000 LE",
      "originalPrice": "90000 LE",
      "discount": "6%",
      "rating": 4.9,
      "reviews": 567,
      "inStock": true,
      "colors": ["Space Gray", "Silver"],
      "sizes": ["512GB", "1TB", "2TB"],
      "category": "Laptop",
      "brand": "Apple",
      "features": ["M3 Max Chip", "32GB Memory", "Liquid Retina XDR", "All-day Battery"]
    },
    {
      "id": 6,
      "image": "images/keyboard.jpeg",
      "title": "Mechanical Gaming Keyboard",
      "description": "RGB backlit mechanical keyboard with blue switches and programmable keys",
      "price": "1200 LE",
      "originalPrice": "1500 LE",
      "discount": "20%",
      "rating": 4.4,
      "reviews": 743,
      "inStock": true,
      "colors": ["Black", "White"],
      "sizes": ["Full Size", "Compact"],
      "category": "Keyboard",
      "brand": "GamePro",
      "features": ["RGB Backlighting", "Blue Switches", "Programmable", "Anti-Ghosting"]
    }
  ];

  void onBottomNavTapped(int index) {
    setState(() {
      selectedBottomNavIndex = index;
    });

    // Handle navigation based on index
    switch (index) {
      case 0:
      // Already on home
        break;
      case 1:
      // Navigate to cart/shopping bag
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Shopping cart feature coming soon!'))
        );
        break;
      case 2:
      // Navigate to profile
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile feature coming soon!'))
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedBottomNavIndex,
          onTap: onBottomNavTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ]
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              // Search bar and menu
              Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search products...",
                            border: InputBorder.none,
                            fillColor: Colors.grey[200],
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Menu feature coming soon!'))
                            );
                          },
                        ),
                      ),
                    )
                  ]
              ),

              SizedBox(height: 30),

              // Categories section
              Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
              ),

              SizedBox(height: 20),

              Container(
                height: 140,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${categories[i]['title']} category selected!'))
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(20),
                              child: Icon(categories[i]['iconName'], size: 40, color: Colors.orange),
                            ),
                            SizedBox(height: 8),
                            Text(
                                categories[i]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                    fontSize: 14
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Best Selling section
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Best Selling",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('See all products feature coming soon!'))
                        );
                      },
                      child: Text("See All", style: TextStyle(color: Colors.orange)),
                    ),
                  ],
                ),
              ),

              GridView.builder(
                itemCount: bestSelling.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 320,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ItemsDetails(data: bestSelling[i])
                          )
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product image with discount badge
                          Stack(
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.asset(
                                    bestSelling[i]["image"],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (bestSelling[i]["discount"] != null)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "-${bestSelling[i]["discount"]}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          // Product details
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bestSelling[i]["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 4),

                                Text(
                                  bestSelling[i]["description"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 8),

                                // Rating
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      "${bestSelling[i]["rating"]} (${bestSelling[i]["reviews"]})",
                                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8),

                                // Price
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bestSelling[i]["price"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        if (bestSelling[i]["originalPrice"] != null)
                                          Text(
                                            bestSelling[i]["originalPrice"],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}