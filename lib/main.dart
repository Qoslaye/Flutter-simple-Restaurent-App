import 'package:flutter/material.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantPage(),
    );
  }
}

class RestaurantPage extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {"name": "Pizza", "image": "assets/pizza.jpg"},
    {"name": "Hum Burger", "image": "assets/burger.jpg"},
    {"name": "Hilib", "image": "assets/steak.jpg"},
    {"name": "Sushi", "image": "assets/sushi.jpg"},
    {"name": "Salad", "image": "assets/salad.jpg"},
    {"name": "Italian Pasta", "image": "assets/pasta.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality can be added here
            },
          ),
        ],
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Container(
        color: Colors.red.shade100,
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FoodCard(
                name: foodItems[index]['name']!,
                image: foodItems[index]['image']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String image;

  FoodCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            child: Image.asset(
              image,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Delicious $name to satisfy your cravings!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
