import 'package:flutter/material.dart';
import 'package:gas_station/res/text_styles.dart';

class TextIconButton extends StatelessWidget {
  TextIconButton({Key key, @required this.text, @required this.icon,@required this.onPressed,})
      : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(text,style: TextStyles.black_12,),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}
