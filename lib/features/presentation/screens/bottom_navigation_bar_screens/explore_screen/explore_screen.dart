import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'widgets/filter_and_search_field.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [FilterAndSearchField()],
      ),
    ));
  }
}
