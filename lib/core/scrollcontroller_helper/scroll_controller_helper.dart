import 'dart:developer';

import 'package:flutter/material.dart';

class ScrollControllerHelper {
  static Future<void> animateControllerEndPage(
      {required ScrollController scrollController,
      double reducescrollPost = 0}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    log('CALLed scroll ');
    await scrollController.animateTo(
        scrollController.position.maxScrollExtent - reducescrollPost,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn);
  }
}
