import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package
import '../data/food.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  const FoodDetailPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                food.name,
                style: const TextStyle(
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      color: Colors.indigo,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    food.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/error.jpg"),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Resep:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      food.desc,
                      style: const TextStyle(fontSize: 16),
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
