import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final String label;

  const TabInfo(this.icon, this.label);
}

const List<TabInfo> TABS = [
  TabInfo(Icons.account_balance_outlined, '지갑'),
  TabInfo(Icons.alarm_add_outlined, '알람'),
  TabInfo(Icons.keyboard, '키보드'),
  TabInfo(Icons.ac_unit, '온도'),
  TabInfo(Icons.adb, '안드로이드'),
];
