import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'c_1.dart';

class AnimationTestPage1 extends StatelessWidget {
  const AnimationTestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnimationTestController());
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                controller.forward();
                await Future.delayed(const Duration(milliseconds: 3500));
                controller.reverse();
              },
              child: ValueListenableBuilder(
                valueListenable: controller.animatedValue,
                builder: (context, animatedValue, child) {
                  return Container(
                    width: 50 + (animatedValue * 150),
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
