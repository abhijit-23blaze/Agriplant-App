import 'package:flutter/material.dart';

import '../../../../../data/models/order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
final Order order ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${order.id}'),
      ),
    );
  }
}
