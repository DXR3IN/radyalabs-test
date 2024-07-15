import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:radyalabs_test/widget/drawer.dart';
import 'package:radyalabs_test/widget/grid_card.dart';
import '../data/food.dart';
import '../services/api_service.dart';
import 'food_detail_page.dart';

class FoodGridPage extends StatefulWidget {
  @override
  _FoodGridPageState createState() => _FoodGridPageState();
}

class _FoodGridPageState extends State<FoodGridPage> {
  late Future<List<Food>> futureFoods;

  @override
  void initState() {
    super.initState();
    futureFoods = ApiService().fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<List<Food>>(
        future: futureFoods,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No foods available'));
          } else {
            final int itemCount = snapshot.data!.length;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.indigo,
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/background.jpg",
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        const Positioned.fill(
                          child: Center(
                            child: Text(
                              'Resep-resep Makanan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.indigo,
                                    blurRadius: 2,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: const [
                    Row(
                      children: [
                        Text(
                          'RadyaLabs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-4x25iEHecvUif1h8Wr4WgCJgH8upUIPBPw&s"),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 10),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Jumlah resep:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey[600],
                                border: Border.all(color: Colors.indigo),
                              ),
                              child: Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Makanan",
                              style: TextStyle(
                                  color: Colors
                                      .white), // Added text color for better visibility
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Food food = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetailPage(food: food),
                              ),
                            );
                          },
                          child: gridCard(context, food),
                        );
                      },
                      childCount: itemCount,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      drawer: myDrawer(context),
    );
  }
}
