import 'package:agriplant/core/utils/assets_data.dart';
import 'package:agriplant/features/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AssetsData.onBoarding,
              width: 300,
            ),
            const Spacer(),
            Text(
              'Welcome To Agriplant ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
                textAlign: TextAlign.center,
              ),
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icon: const Icon(IconlyLight.login),
                label: const Text('Continue With Google')),
          ],
        ),
      ),
    );
  }
}
