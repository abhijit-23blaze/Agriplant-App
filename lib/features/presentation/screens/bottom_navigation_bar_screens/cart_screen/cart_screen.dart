import 'package:agriplant/features/data/products.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/cart_screen/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/cart.dart';

int countValue = 1;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    //List<Product> cartItems = products.take(4).toList();
    // final totalPrice = cartItems.map((item) => item.price).reduce((acc, curr) => acc + curr);
    final totalPrice = cart
        .map((item) => item.price * item.count)
        .reduce((acc, curr) => acc + curr);

    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: cart.length * 150,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CartItem(
                    onCountValueChanged: (newCountValue) {
                      setState(() {
                        cart[index].count = newCountValue;
                      });
                    },
                    product: cart[index],
                    onDismissed: (direction) {
                      setState(() {
                        cart.removeAt(index);
                        products.removeAt(index);
                      });
                    },
                  );
                },
                itemCount: cart.length,
              ),
            ),
            buildItemsCountAndPrice(cart, totalPrice, context),
            buildProceedButton(),
          ],
        ),
      ),
    );
  }

  Widget buildItemsCountAndPrice(
      List<dynamic> cartItems, totalPrice, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(top: 0),
      child: Row(
        children: [
          Text(
            'Total (${cartItems.length} items )',
          ),
          const Spacer(),
          Text('$totalPrice\$',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildProceedButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(IconlyBold.arrowRight),
        label: const Text(
          'Proceed To Checkout',
        ),
      ),
    );
  }
}

AppBar customAppBar(context) => AppBar(
      scrolledUnderElevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Wilson! 👋',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Enjoy Our Services !',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton.filledTonal(
            onPressed: () {},
            icon: badges.Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              position: badges.BadgePosition.topEnd(top: -13, end: -13),
              child: const Icon(
                IconlyBroken.notification,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
