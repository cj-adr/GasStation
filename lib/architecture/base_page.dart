import 'package:flutter/widgets.dart';
import 'package:gas_station/architecture/base_view_model.dart';
import 'package:gas_station/architecture/types.dart';

class BasePage<T extends BaseViewModel> extends StatefulWidget {
  final ViewBuilder _widgetBuilder;

  final T _baseViewModel;

  const BasePage(this._widgetBuilder, this._baseViewModel);

  @override
  State<StatefulWidget> createState() {
    return _BaseState();
  }
}

class _BaseState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return widget._widgetBuilder(widget._baseViewModel);
  }

  _BaseState() {
    widget._baseViewModel.state = this;
  }
}
