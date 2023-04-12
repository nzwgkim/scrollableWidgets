import 'package:flutter/material.dart';

import '../../const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TABS.length * 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Basic Appbar Tabbar'),
            bottom: TabBar(
              indicatorColor: Colors.yellow,
              isScrollable: true,
              tabs: [
                ...TABS,
                ...TABS,
                ...TABS,
              ]
                  .map((e) => Tab(
                        icon: Icon(e.icon),
                        child: Text(e.label),
                      ))
                  .toList(),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...TABS,
              ...TABS,
              ...TABS,
            ].map((e) => Icon(e.icon)).toList(),
          ),
        ));
  }
}
