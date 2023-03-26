import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/rainbow_colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/render_color_widget.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  SingleChildScrollViewScreen({super.key});

  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),

          /// scroll시에 화면 크기가 보존됨
          /// clipBehavior: Clip.none,

          /// 화면이 넘어가지 않아도 스크롤 됨.
          /// physics:AlwaysScrollableScrollPhysics(),
          ///
          /// 화면 bouncing 효과. iOS style
          /// physics:BouncingScrollPhysics(),
          ///
          /// 화면 bouncing 효과. android style
          /// physics:ClampingScrollPhysics(),
          ///
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: numbers
                .map((e) => RenderColorWidget(
                      color: rainbowColors[e % rainbowColors.length],
                      number: e.toString(),
                    ))
                .toList(),
          )),
    );
  }
}
