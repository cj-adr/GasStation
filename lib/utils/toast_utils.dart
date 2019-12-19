import 'package:flutter/material.dart';
import 'package:gas_station/components/toast.dart';

class ToastUtils {
  static show(BuildContext context, String msg) {
    Toast.show(context, msg, widget: _createTextWidget(context, msg),gravity: Toast.BOTTOM);
  }

  static showError(BuildContext context, String msg) {
    Toast.show(context, msg, iconName: 'common_error', gravity: Toast.CENTER);
  }

  static showSuccess(BuildContext context, String msg) {
    Toast.show(context, msg, iconName: 'common_success', gravity: Toast.CENTER);
  }

  static Widget _createTextWidget(BuildContext context, String msg) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xcc000000),
            borderRadius: BorderRadius.circular(20),
          ),

          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text(msg,
              softWrap: true,
              style: TextStyle(fontSize: 15, color: Colors.white)),
        ));
  }
}
