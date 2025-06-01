import 'package:flutter/material.dart';
import 'package:travel_planner/widgets/featured_homestays.dart';
import 'package:travel_planner/widgets/trending_activities.dart';
import 'package:travel_planner/widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // TODO: Implement profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featured Homestays',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FeaturedHomestays(),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Trending Activities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TrendingActivities(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}