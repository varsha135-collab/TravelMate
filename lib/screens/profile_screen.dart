import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const CircleAvatar(
              radius: 55,

              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Travel Explorer',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'student@gmail.com',

              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: () {

                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                );
              },

              icon: const Icon(
                Icons.logout,
              ),

              label: const Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}