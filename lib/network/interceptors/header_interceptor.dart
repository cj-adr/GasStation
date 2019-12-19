import 'package:dio/dio.dart';
import 'package:gas_station/preference/preference_manage.dart';

/// header拦截器
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    // 动态修改header
    var token = await PreferenceManage.getToken();
    options.headers.addAll({
      "b-c-t": token,
      "User-Agent": _getAgent(),
    });

    return options;
  }

  /// 获取代理
  String _getAgent() {
    return "{\"version\":\"1.0.0\",\"device\":\"0\"}";
  }
}
