import 'package:flutter/material.dart';

import '../../const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: TABS.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBarScreen'),
      ),
      body: TabBarView(
          controller: tabController,
          children: TABS.map((e) => Icon(e.icon)).toList()),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        currentIndex: tabController.index,
        type: BottomNavigationBarType.shifting,
        onTap: (value) => setState(() {
          tabController.index = value;
        }),
        items: TABS
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
      ),
    );
  }
}
