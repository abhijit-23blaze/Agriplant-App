import 'package:flutter/material.dart';
import 'widgets/consultation_card.dart';
import 'widgets/featured_product_grid_view.dart';
import 'widgets/featured_products.dart';
import 'widgets/filter_and_search_field.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          const FilterAndSearchField(),
          const ConsultationCard(),
          const FeaturedProducts(),
          FeaturedProductGridView()
        ],
      ),
    ));
  }
}






