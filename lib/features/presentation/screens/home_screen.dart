import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/cart_screen/cart_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/explore_screen/explore_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/profile_screen.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/services_screen/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeScreen({super.key});
  List<Widget> screens = const [
    ExploreScreen(),
    ServicesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            label: "Services",
            activeIcon: Icon(IconlyBold.call),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: "Cart",
            activeIcon: Icon(IconlyBold.buy),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: "Profile",
            activeIcon: Icon(IconlyBold.profile),
          ),
        ],
      );
}
