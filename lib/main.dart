import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            buildFoodCard(
              context,
              'assets/pizza.png',
              'Vegetable Pizza',
            ),

            buildFoodCard(
              context,
              'assets/burger.png',
              'Beef Burger',
            ),

            buildFoodCard(
              context,
              'assets/pasta.png',
              'Spaghetti Bolognese',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, String imagePath, String foodName) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsPage(
                imagePath: imagePath,
                foodName: foodName,
              ),
            ),
          );
        },
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.restaurant,
                    size: 60,
                    color: Colors.white,
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                foodName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class FoodDetailsPage extends StatelessWidget {
  final String imagePath;
  final String foodName;

  const FoodDetailsPage({
    super.key,
    required this.imagePath,
    required this.foodName,
});

  String get description {
    switch (foodName) {
      case 'Vegetable Pizza':
        return 'A delicious pizza topped with fresh vegetables and melted cheese.';
      case 'Beef Burger':
        return 'A juicy beef patty served in a soft bun with fresh vegetables.';
      case 'Spaghetti Bolognese':
        return 'Spaghetti served with a rich tomato and minced beef sauce.';
      default:
        return 'Enjoy our delicious food!';
    }
  }

  String get ingredients {
    switch (foodName) {
      case 'Vegetable Pizza':
        return 'Pizza dough, tomato sauce, cheese, capsicum, mushrooms and onions.';
      case 'Beef Burger':
        return 'Beef patty, burger bun, lettuce, tomato, cheese and sauce.';
      case 'Spaghetti Bolognese':
        return 'Spaghetti, minced beef, tomatoes, onions, garlic and herbs.';
      default:
        return 'Ingredients information is unavailable.';
    }
  }

  String get price {
    switch (foodName) {
      case 'Vegetable Pizza':
        return 'RM 18.90';
      case 'Beef Burger':
        return 'RM 12.90';
      case 'Spaghetti Bolognese':
        return 'RM 15.90';
      default:
        return 'Price unavailable';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Details'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            imagePath,
            width: 250,
            height: 220,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          foodName,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
         'Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        const Text(
          'Ingredients',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          ingredients,
          style: const TextStyle(fontSize: 16),
        ),
       ],
      ),
     ),
    );
   }
  }
