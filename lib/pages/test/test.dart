import 'package:flutter/cupertino.dart';
import 'package:gas_station/architecture/base_page.dart';
import 'package:gas_station/architecture/base_view_model.dart';

part 'view.dart';

part 'viewmodel.dart';

Widget buildTest() => BasePage((vm) => buildWidget(vm), ViewModel());
