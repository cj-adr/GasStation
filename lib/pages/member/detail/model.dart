import 'package:flutter/widgets.dart';
import 'package:gas_station/architecture/base_model.dart';
import 'package:gas_station/models/user/user_entity.dart';
import 'package:gas_station/network/response_bean.dart';
import 'package:gas_station/pages/member/services.dart';

class Model extends BaseModel {
  int id = 0;

  Model(this.id);

  void increment() {
    id++;
    notifyListeners();
  }

  void testLogin(BuildContext context) async {
    ResponseBean<UserEntity> resp =
        await login(cancelToken, '15158081188', '111111');
    if (resp.success) {
      debugPrint(resp.data.token);
      Navigator.pop(context);
    } else {
      debugPrint('error');
      Navigator.pop(context);
    }
  }

  @override
  void onStart() {
    print('onstart');
    increment();
  }

  @override
  void onStop() {
    print('onStop');
  }
}
