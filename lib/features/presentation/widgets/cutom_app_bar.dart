import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';

AppBar customAppBar(context,
        {Widget? titleWidget, List<Widget>? actionsWidgets}) =>
    AppBar(
      scrolledUnderElevation: 0,
      title: titleWidget ??
          Column(
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
      actions: actionsWidgets ??
          [
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
