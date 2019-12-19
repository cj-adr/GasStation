import 'package:dio/dio.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/preference/preference_manage.dart';

import '../response_bean.dart';

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

  @override
  Future onResponse(Response response) async {
    if (response.statusCode == 200) {
      var resp = ResponseBean.fromJson(response.data);
      print('token过期判断 errCode： ${resp.errCode}');

      /// TODO 判断errCode是否是token过期标识，进行逻辑处理
      if ('666' == resp.errCode) {
        var token = _getToken();
        response.request.headers['b-c-t'] = token;

        /// 继续未完成的请求
        return await api.request(response.request);
      }
    }

    return response;
  }

  /// 获取代理
  String _getAgent() {
    return "{\"version\":\"1.0.0\",\"device\":\"0\"}";
  }

  /// 获取新的token
  Future<String> _getToken() async {
    /// TODO 刷新token
    return "";
  }
}
