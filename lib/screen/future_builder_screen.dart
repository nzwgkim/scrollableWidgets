import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatelessWidget {
  const FutureBuilderScreen({super.key});

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 3));
    final randomNumber = Random();

    // throw  Exception('아무거나 던져도됨');
    return randomNumber.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      // if (i == 5) {
      //   throw 'i==5';
      // }
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureBuilderScreen"),
      ),
      body: Column(
        children: [
          FutureBuilder(
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
                    ],
                  ),
                );
              }),
          StreamBuilder(
              stream: streamNumbers(),
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
                      Text('StreamBuilder',
                          style: style.copyWith(color: Colors.green[400])),

                      /// FutureBuilder에서는 아래 3가지 parameter만 알면된다.
                      Text('state = ${snapshot.connectionState}',
                          style: style.copyWith(color: Colors.green[400])),
                      Text('data = ${snapshot.data}',
                          style: style.copyWith(color: Colors.green[400])),
                      Text('error = ${snapshot.error}',
                          style: style.copyWith(color: Colors.green[400])),
                    ],
                  ),
                );
              }),
          // ElevatedButton(
          //     onPressed: () {
          //       /// setState는 build를 실행시키므로, FutureBuilder를 호출할 수 있다.
          //       /// 이때, FutureBuilder는 이전 값을 기억하는 캐싱 기능을 가지고 있다.
          //       setState(() {});
          //     },
          //     child: const Text(
          //       'setState',
          //       style: style,
          //     ))
        ],
      ),
    );
  }
}
