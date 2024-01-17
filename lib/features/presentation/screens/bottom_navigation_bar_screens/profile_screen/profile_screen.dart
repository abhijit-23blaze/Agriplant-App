import 'package:agriplant/features/presentation/widgets/cutom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}
