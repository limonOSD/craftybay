import 'dart:async';

import 'package:get/get.dart';

class TimeDecraceController extends GetxController {
  int countdown = 12;
  bool buttonEnabled = false;
  late Timer timer;

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      countdown--;
      update();
      if (countdown <= 0) {
        buttonEnabled = true;
        timer.cancel();
        update();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void countStart() {
    if (countdown == 0) {
      buttonEnabled = false;
    }
  }
}
