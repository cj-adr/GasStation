import 'dart:ui';

import 'package:flutter/widgets.dart';

class BaseViewModel {
  State state;

  void setState(VoidCallback fn) {
    state.setState(fn);
  }
}
