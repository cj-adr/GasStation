import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_station/architecture/base_model.dart';
import 'package:scoped_model/scoped_model.dart';

class BasePage<T extends BaseModel> extends StatefulWidget {
  final T _model;
  final WidgetBuilder _widgetBuilder;

  const BasePage(this._widgetBuilder, this._model);

  @override
  State<StatefulWidget> createState() {
    return _BaseState<T>();
  }
}

class _BaseState<T extends BaseModel> extends State<BasePage<T>> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
      model: widget._model,
      child: ScopedModelDescendant<T>(
        builder: (context, child, model) {
          return widget._widgetBuilder(context, model);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget._model.onStart();
  }

  @override
  void dispose() {
    super.dispose();
    widget._model.onStop();
  }
}

typedef WidgetBuilder<T extends Model> = Widget Function(
    BuildContext context, T viewModel);
