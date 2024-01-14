import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'widgets/consultation_card.dart';
import 'widgets/featured_product_grid_view.dart';
import 'widgets/featured_products.dart';
import 'widgets/filter_and_search_field.dart';
import 'package:badges/badges.dart' as badges;

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                FilterAndSearchField(),
                ConsultationCard(),
                FeaturedProducts(),
                FeaturedProductGridView()
              ],
            ),
          ),
        ));
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
}
