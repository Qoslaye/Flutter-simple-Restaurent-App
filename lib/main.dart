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
    {"name": "Burger", "image": "assets/burger.jpg"},
    {"name": "Steak", "image": "assets/steak.jpg"},
    {"name": "Sushi", "image": "assets/sushi.jpg"},
    {"name": "Salad", "image": "assets/salad.jpg"},
    {"name": "Pasta", "image": "assets/pasta.jpg"},
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
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Set title text color to white
      ),
      body: Container(
        color: Colors.red.shade100,
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return FoodCard(
              name: foodItems[index]['name']!,
              image: foodItems[index]['image']!,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
