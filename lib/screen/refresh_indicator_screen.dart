import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  RefreshIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'RefreshIndicatorScreen',
        body: RefreshIndicator(
          onRefresh: () async {
            // get data from server...
            await Future.delayed(const Duration(seconds: 3));
          },
          child: ListView(
            children: numbers
                .map((e) => RenderColorWidget(
                    color: rainbowColors[e % rainbowColors.length],
                    number: e.toString()))
                .toList(),
          ),
        ));
  }
}
