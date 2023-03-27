import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class CustomerScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomerScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("CustomScrollViewScreen"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              numbers
                  .map(
                    (e) => RenderColorWidget(
                        color: rainbowColors[e % rainbowColors.length],
                        number: e.toString()),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
