import 'package:dio/dio.dart';

/// header拦截器
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    // 动态修改header
    options.headers.addAll({
      "b-c-t": _getToken(),
      "User-Agent": _getAgent(),
    });

    return options;
  }

  /// 获取代理
  String _getAgent() {
    return "{\"version\":\"1.0.0\",\"device\":\"0\"}";
  }

  /// 获取token
  String _getToken() {
    // TODO 用户登录成功后返回
    return "";
  }
}
