import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/HomePage/HomePage.dart';
import 'package:mobile_app/main.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // User is signed in
              return HomePage();
            } else {
              // User is not signed in
              return Login();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the stream
            return const Center(child: CircularProgressIndicator());
          } else {
            // Handle other states (e.g., error)
            return const Center(child: Text("Something went wrong."));
          }
        },
      ),
    );
  }
}
