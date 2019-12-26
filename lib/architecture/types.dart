import 'package:flutter/widgets.dart';
import 'package:gas_station/architecture/base_view_model.dart';

typedef ViewBuilder<T extends BaseViewModel> = Widget Function(T viewModel);
