import 'package:dio/dio.dart';
import 'package:gas_station/models/user/user_entity.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/network/response_bean.dart';
import 'package:gas_station/network/url_paths.dart';

Future<ResponseBean<UserEntity>> login(
    CancelToken cancelToken, String mobile, String pwd) async {
  var body = {"mobile": mobile, "pwd": pwd, "loginType": "MOBILE_PWD"};
  var resp = await api.post<UserEntity>(UrlPaths.LOGIN_PATH, data: body);
  return resp;
}
