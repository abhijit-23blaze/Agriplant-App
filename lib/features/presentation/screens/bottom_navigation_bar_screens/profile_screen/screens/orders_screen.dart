import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Processing", "Picking", "Shipping", "Delivered"];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My orders '),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) => Tab(
                text: tabs[index],
              ),
            ),
          ),
        ),
        body: const Center(
          child: Text('Orders Screen'),
        ),
      ),
    );
  }
// AppBar ordersScreenAppBar()=>AppBar(
//   title: Text('My orders '),
//   bottom: TabBar(
//     tabs: [
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//     ],
//   ),
// );
}
