import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/trip_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/destinations_screen.dart';
import 'screens/destination_details_screen.dart';
import 'screens/add_trip_screen.dart';
import 'screens/my_trips_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
      create: (_) => TripProvider(),

      child: const TravelMateApp(),
    ),
  );
}

class TravelMateApp extends StatelessWidget {

  const TravelMateApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'TravelMate',

      theme: AppTheme.lightTheme,

      initialRoute: '/login',

      routes: {

        '/login': (context) =>
            const LoginScreen(),

        '/home': (context) =>
            const HomeScreen(),

        '/destinations': (context) =>
            const DestinationsScreen(),

        '/destination-details': (context) =>
            const DestinationDetailsScreen(),

        '/add-trip': (context) =>
            const AddTripScreen(),

        '/my-trips': (context) =>
            const MyTripsScreen(),

        '/profile': (context) =>
            const ProfileScreen(),
      },
    );
  }
}