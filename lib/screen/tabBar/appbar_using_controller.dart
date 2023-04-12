import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({super.key});

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    // tabController 초기화
    tabController = TabController(length: TABS.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Using Controller'),
        bottom: TabBar(
            controller: tabController,
            tabs: TABS
                .map(
                  (e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ),
                )
                .toList()),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(e.icon),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => tabController.animateTo(
                              tabController.index > 0
                                  ? tabController.index - 1
                                  : tabController.index),
                          child: const Text('Prev')),
                      ElevatedButton(
                          onPressed: () => tabController.animateTo(
                              tabController.index < TABS.length - 1
                                  ? tabController.index + 1
                                  : tabController.index),
                          child: const Text('Next')),
                    ],
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
