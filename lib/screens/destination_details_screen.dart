import 'package:flutter/material.dart';

class DestinationDetailsScreen
    extends StatelessWidget {

  const DestinationDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final args =
        ModalRoute.of(context)!
            .settings
            .arguments as Map<String, String>;

    final name = args['name']!;
    final image = args['image']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Stack(
              children: [

                Image.asset(
                  image,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: 20,
                  left: 20,

                  child: Text(
                    name,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    'About this destination',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '$name is a beautiful destination '
                    'with amazing scenery, culture, '
                    'food and exciting activities.',

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(
                          context,
                          '/add-trip',
                        );
                      },

                      child: const Text(
                        'PLAN MY TRIP',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}