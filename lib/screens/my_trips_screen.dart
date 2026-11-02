import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trip_provider.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        Provider.of<TripProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
      ),

      body: provider.trips.isEmpty

          ? const Center(
              child: Text(
                'No trips planned yet.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount:
                  provider.trips.length,

              itemBuilder:
                  (context, index) {

                final trip =
                    provider.trips[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(
                    leading:
                        const CircleAvatar(
                      child: Icon(
                        Icons.flight_takeoff,
                      ),
                    ),

                    title: Text(
                      trip.destination,
                    ),

                    subtitle: Text(
                      '${trip.date}\n'
                      '${trip.travelers} travelers • '
                      '₹${trip.budget}\n'
                      '${trip.type}',
                    ),

                    isThreeLine: true,

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),

                      onPressed: () {
                        provider
                            .removeTrip(index);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}