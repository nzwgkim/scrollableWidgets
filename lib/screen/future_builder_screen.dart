import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatefulWidget {
  const FutureBuilderScreen({super.key});

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 3));
    final randomNumber = Random();

    // throw  Exception('아무거나 던져도됨');
    return randomNumber.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureBuilderScreen"),
      ),
      body: FutureBuilder(
          future: getNumber(),
          builder: (context, snapshot) {
            if (!snapshot.hasData && !snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData && snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('FutureBuilder', style: style),

                  /// FutureBuilder에서는 아래 3가지 parameter만 알면된다.
                  Text('state = ${snapshot.connectionState}', style: style),
                  Text('data = ${snapshot.data}', style: style),
                  Text('error = ${snapshot.error}', style: style),
                  ElevatedButton(
                      onPressed: () {
                        /// setState는 build를 실행시키므로, FutureBuilder를 호출할 수 있다.
                        /// 이때, FutureBuilder는 이전 값을 기억하는 캐싱 기능을 가지고 있다.
                        setState(() {});
                      },
                      child: const Text(
                        'setState',
                        style: style,
                      ))
                ],
              ),
            );
          }),
    );
  }
}
