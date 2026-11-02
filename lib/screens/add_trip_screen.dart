import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/trip.dart';
import '../providers/trip_provider.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() =>
      _AddTripScreenState();
}

class _AddTripScreenState
    extends State<AddTripScreen> {

  final formKey = GlobalKey<FormState>();

  final destinationController =
      TextEditingController();

  final dateController =
      TextEditingController();

  final travelersController =
      TextEditingController();

  final budgetController =
      TextEditingController();

  String travelType = 'Adventure';

  void createTrip() {

    if (!formKey.currentState!.validate()) {
      return;
    }

    final trip = Trip(
      destination:
          destinationController.text,

      date:
          dateController.text,

      travelers:
          int.parse(
            travelersController.text,
          ),

      budget:
          double.parse(
            budgetController.text,
          ),

      type: travelType,
    );

    Provider.of<TripProvider>(
      context,
      listen: false,
    ).addTrip(trip);

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Trip created successfully!',
        ),
      ),
    );

    Navigator.pushReplacementNamed(
      context,
      '/my-trips',
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Plan New Trip',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [

              TextFormField(
                controller:
                    destinationController,

                decoration:
                    const InputDecoration(
                  labelText: 'Destination',
                  prefixIcon:
                      Icon(Icons.location_on),
                ),

                validator: (value) {

                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Enter a destination';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: dateController,

                decoration:
                    const InputDecoration(
                  labelText: 'Travel Date',
                  hintText: 'Example: 12 Oct 2026',
                  prefixIcon:
                      Icon(Icons.calendar_month),
                ),

                validator: (value) {

                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Enter a travel date';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    travelersController,

                keyboardType:
                    TextInputType.number,

                decoration:
                    const InputDecoration(
                  labelText: 'Number of Travelers',
                  prefixIcon:
                      Icon(Icons.people),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter number of travelers';
                  }

                  if (int.tryParse(value) ==
                      null) {
                    return 'Enter a valid number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    budgetController,

                keyboardType:
                    TextInputType.number,

                decoration:
                    const InputDecoration(
                  labelText: 'Budget',
                  prefixIcon:
                      Icon(Icons.currency_rupee),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter your budget';
                  }

                  if (double.tryParse(value) ==
                      null) {
                    return 'Enter a valid amount';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: travelType,

                decoration:
                    const InputDecoration(
                  labelText: 'Travel Type',
                ),

                items: const [

                  DropdownMenuItem(
                    value: 'Adventure',
                    child:
                        Text('Adventure'),
                  ),

                  DropdownMenuItem(
                    value: 'Relaxation',
                    child:
                        Text('Relaxation'),
                  ),

                  DropdownMenuItem(
                    value: 'Family',
                    child:
                        Text('Family'),
                  ),

                  DropdownMenuItem(
                    value: 'Historical',
                    child:
                        Text('Historical'),
                  ),
                ],

                onChanged: (value) {

                  setState(() {
                    travelType = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: createTrip,

                  child: const Text(
                    'CREATE TRIP',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    destinationController.dispose();
    dateController.dispose();
    travelersController.dispose();
    budgetController.dispose();

    super.dispose();
  }
}