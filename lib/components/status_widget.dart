import 'package:flutter/material.dart';
import 'package:gas_station/res/clrs.dart';
import 'package:gas_station/res/text_styles.dart';

/// 状态界面
class StatusWidget extends StatefulWidget {
  final int _state;
  final VoidCallback _onRetry;

  StatusWidget(this._state, {Key key, VoidCallback onRetry})
      : _onRetry = onRetry,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatusWidgetState(_state, _onRetry);
  }
}

class StatusWidgetState extends State<StatusWidget> {
  int _state;
  final VoidCallback _onRetry;

  StatusWidgetState(this._state, this._onRetry);

  @override
  Widget build(BuildContext context) {
    var content;

    switch (_state) {
      case 0: // 加载中
        content = CircularProgressIndicator();
        break;

      case 1:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('没有数据！'),
            MaterialButton(
              onPressed: _onRetry,
              color: Clrs.textBlue,
              hoverColor: Clrs.alphaColorPrimary,
              child: Text("点击重试", style: TextStyles.white_14),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ],
        );
        break;

      case -1:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('数据请求失败！'),
            MaterialButton(
              onPressed: _onRetry,
              color: Clrs.textBlue,
              hoverColor: Clrs.alphaColorPrimary,
              child: Text("点击重试", style: TextStyles.white_14),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ],
        );
        break;

      default:
        return null;
    }

    return Center(
      child: content,
    );
  }

  refresh(state) {
    setState(() {
      _state = state;
    });
  }
}
