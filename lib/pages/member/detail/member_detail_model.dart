import 'package:gas_station/architecture/base_model.dart';

class MemberDetailModel extends BaseModel {
  int id = 0;

  MemberDetailModel(this.id);

  void increment() {
    id++;
    notifyListeners();
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
