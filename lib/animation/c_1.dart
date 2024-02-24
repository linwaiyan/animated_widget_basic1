import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationTestController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  ValueNotifier<double> animatedValue = ValueNotifier(0);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    super.onClose();
    if (animationController != null) {
      animationController!.dispose();
    }
  }

  Future<void> initLoad() async {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animationController!.addListener(() {
      animatedValue.value = animationController!.value;
      animatedValue.notifyListeners();
    });
  }

  Future<void> forward() async {
    if (animationController != null) {
      animationController!.forward();
    }
  }

  Future<void> reverse() async {
    if (animationController != null) {
      animationController!.reverse();
    }
  }
}
