import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ReorderableListViewScreen',
        body: ReorderableListView.builder(
          itemBuilder: (context, index) => RenderColorWidget(
              key: Key(index.toString()),
              color: rainbowColors[numbers[index] % rainbowColors.length],
              number: numbers[index].toString()),
          itemCount: numbers.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = numbers.removeAt(oldIndex);
              numbers.insert(newIndex, item);
            });
          },
        ));
  }
}
