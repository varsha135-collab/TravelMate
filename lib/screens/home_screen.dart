import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TravelMate'),

        actions: [
          IconButton(
            icon: const Icon(Icons.person),

            onPressed: () {
              Navigator.pushNamed(
                context,
                '/profile',
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              'Welcome, Traveler! 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Where do you want to go next?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations...',
                prefixIcon:
                    const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Popular Destinations',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 200,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  destinationPreview(
                    context,
                    'Manali',
                    'assets/manali.jpg',
                  ),

                  destinationPreview(
                    context,
                    'Goa',
                    'assets/goa.jpeg',
                  ),

                  destinationPreview(
                    context,
                    'Assam',
                    'assets/assam.jpg',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/destinations',
                  );
                },

                icon: const Icon(
                  Icons.explore,
                ),

                label: const Text(
                  'Explore Destinations',
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/add-trip',
                  );
                },

                icon: const Icon(
                  Icons.add_location_alt,
                ),

                label: const Text(
                  'Plan a New Trip',
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/my-trips',
                  );
                },

                icon: const Icon(
                  Icons.luggage,
                ),

                label: const Text(
                  'My Trips',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget destinationPreview(
    BuildContext context,
    String name,
    String image,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/destination-details',

          arguments: {
            'name': name,
            'image': image,
          },
        );
      },

      child: Container(
        width: 165,

        margin: const EdgeInsets.only(
          right: 12,
        ),

        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(18),

          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          children: [

            Positioned(
              left: 12,
              bottom: 12,

              child: Text(
                name,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}