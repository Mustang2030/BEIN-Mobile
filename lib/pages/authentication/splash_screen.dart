import 'dart:async';
import 'package:bein_mobile/blocs/auth/auth_bloc.dart';
import 'package:bein_mobile/services/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //Event to check authentication status
    context.read<AuthBloc>().add(CheckAuthStatus());

    Future.delayed(Duration(seconds: 3), () {
      _checkAuthentication();
    });
  }

  void _checkAuthentication() {
    final state = context.read<AuthBloc>().state;

    if (state is Authenticated) {
      AppNavigator.pushAndRemove(context, '/landing');
    } else {
      AppNavigator.pushReplacement(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
                width: 200, height: 200), // Your splash image
            const SizedBox(height: 20),
            const Text(
              "BEIN",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
