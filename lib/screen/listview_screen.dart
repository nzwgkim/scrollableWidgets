import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return RenderColorWidget(
              color: rainbowColors[index % rainbowColors.length],
              number: index.toString());
        },
      ),
    );
  }
}
