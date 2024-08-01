

import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int millisecond;
  Timer? _timer;

  Debouncer({required this.millisecond});

   run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: millisecond), action);
  }

  cancel(){
    _timer!.cancel();
  }
}