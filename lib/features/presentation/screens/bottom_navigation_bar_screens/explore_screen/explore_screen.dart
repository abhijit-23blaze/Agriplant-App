import 'package:flutter/material.dart';
import '../../../widgets/cutom_app_bar.dart';
import 'widgets/consultation_card.dart';
import 'widgets/featured_product_grid_view.dart';
import 'widgets/featured_products.dart';
import 'widgets/filter_and_search_field.dart';

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
}
