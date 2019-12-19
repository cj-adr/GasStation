import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_station/utils/image_utils.dart';

class Toast {
  static final int LENGTH_SHORT = 2;
  static final int LENGTH_LONG = 4;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(BuildContext context, String msg,
      {String iconName = 'common_error',
      int duration = 1,
      int gravity = 0,
      Color backgroundColor = const Color(0xcc000000),
      Color textColor = Colors.white,
      double backgroundRadius = 12,
      Border border,
      Widget widget}) {
    ToastView.dismiss();
    ToastView.createView(msg, context, iconName, duration, gravity,
        backgroundColor, textColor, backgroundRadius, border, widget);
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  static final double TOAST_HEIGHT = 128.0;

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      String iconName,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border,
      Widget widget) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
//        widget: Container(
//          width: MediaQuery.of(context).size.width,
//          child: Container(
//              alignment: Alignment.center,
//              width: MediaQuery.of(context).size.width,
//              child: Container(
//                alignment: Alignment.center,
//                height: TOAST_HEIGHT,
//                width: TOAST_HEIGHT,
//                decoration: BoxDecoration(
//                  color: background,
//                  borderRadius: BorderRadius.circular(backgroundRadius),
//                  border: border,
//                ),
////                  margin: EdgeInsets.symmetric(horizontal: 20),
////                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    ImageUtils.assetImage(iconName),
//                    Padding(
//                      padding: EdgeInsets.only(top: 10),
//                      child: Text(msg,
//                          softWrap: true,
//                          style: TextStyle(fontSize: 15, color: textColor)),
//                    )
//                  ],
//                ),
//              )),
//        ),
          widget: widget != null
              ? widget
              : _createIconTextWidget(context, msg, iconName, duration, gravity,
                  background, textColor, backgroundRadius, border),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(
        Duration(seconds: duration == null ? Toast.LENGTH_SHORT : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }

  static Widget _createIconTextWidget(
      BuildContext context,
      String msg,
      String iconName,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            height: TOAST_HEIGHT,
            width: TOAST_HEIGHT,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(backgroundRadius),
              border: border,
            ),
//                  margin: EdgeInsets.symmetric(horizontal: 20),
//                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ImageUtils.assetImage(iconName),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(msg,
                      softWrap: true,
                      style: TextStyle(fontSize: 15, color: textColor)),
                )
              ],
            ),
          )),
    );
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? 50 : null,
        bottom: gravity == Toast.BOTTOM
            ? 50
            : gravity == Toast.CENTER
                ? MediaQuery.of(context).size.height / 2
                : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
