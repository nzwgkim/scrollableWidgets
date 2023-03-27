import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class CustomerScrollViewSliverGridScreen extends StatelessWidget {
  final List<int> numbers = List.generate(12, (index) => index);
  CustomerScrollViewSliverGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderSliverGrid(),
          renderSliverList(),
        ],
      ),
    );
  }

  Widget renderSliverAppbar() {
    return const SliverAppBar(
      title: Text("CustomScrollViewScreen"),
    );
  }

  Widget renderSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => RenderColorWidget(
                  color: rainbowColors[e % rainbowColors.length],
                  number: e.toString()),
            )
            .toList(),
      ),
    );
  }

  Widget renderSliverGrid() {
    return SliverGrid(
        delegate: SliverChildListDelegate(
          numbers
              .map(
                (e) => RenderColorWidget(
                    color: rainbowColors[e % rainbowColors.length],
                    number: e.toString()),
              )
              .toList(),
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3));
  }
}
