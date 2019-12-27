import 'package:dio/dio.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseModel extends Model {
  CancelToken _cancelToken;

  get cancelToken => _cancelToken;

  BaseModel() {
    _cancelToken = CancelToken();
  }

  void onStart() {}

  void onStop() {
    _cancelToken.cancel();
  }
}
