import 'package:flutter/material.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/custome_scroll_view_sliverlist_screen.dart';
import 'package:scrollable_widgets/screen/grid_view_screen.dart';
import 'package:scrollable_widgets/screen/listview_screen.dart';
import 'package:scrollable_widgets/screen/reoderable_listview.dart';
import 'package:scrollable_widgets/screen/single_child_scroll_view_screen.dart';

import 'custome_scroll_view_slivergrid_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Home',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              SingleChildScrollViewScreen(),
                        ),
                      ),
                  child: const Text('SingleChildScrollView')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ListViewScreen(),
                        ),
                      ),
                  child: const Text('ListViewScreen')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const GridViewScreen(),
                        ),
                      ),
                  child: const Text('GridViewScreen')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ReorderableListViewScreen(),
                        ),
                      ),
                  child: const Text('ReorderableListViewScreen')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              CustomerScrollViewSliverListScreen(),
                        ),
                      ),
                  child: const Text('CustomerScrollViewScreen-SliverList')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              CustomerScrollViewSliverGridScreen(),
                        ),
                      ),
                  child: const Text('CustomerScrollViewScreen-SliverGrid')),
            ],
          ),
        ));
  }
}
