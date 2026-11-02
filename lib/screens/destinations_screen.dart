import 'package:flutter/material.dart';
import '../widgets/destination_card.dart';

class DestinationsScreen extends StatelessWidget {
  const DestinationsScreen({super.key});

  final List<Map<String, String>> destinations = const [

    {
      'name': 'Manali',
      'image': 'assets/manali.jpg',
      'price': '₹8,500',
    },

    {
      'name': 'Goa',
      'image': 'assets/goa.jpeg',
      'price': '₹6,000',
    },

    {
      'name': 'Assam',
      'image': 'assets/assam.jpg',
      'price': '₹7,500',
    },

    {
      'name': 'Kerala',
      'image': 'assets/kerela.jpg',
      'price': '₹9,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          int columns =
              constraints.maxWidth > 600
                  ? 3
                  : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(16),

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),

            itemCount: destinations.length,

            itemBuilder: (context, index) {
              return DestinationCard(
                destination:
                    destinations[index],
              );
            },
          );
        },
      ),
    );
  }
}