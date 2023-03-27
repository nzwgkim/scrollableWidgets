import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "GridViewScreen",
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return RenderColorWidget(
              color: rainbowColors[index % rainbowColors.length],
              number: index.toString());
        },
      ),
    );
  }
}
