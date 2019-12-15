import 'package:dio/dio.dart';
import 'package:gas_station/network/interceptors/header_interceptor.dart';
import 'package:gas_station/network/response_bean.dart';

/// api
class API {
  // 开发
//  var  _baseUrl = "http://k8s.gas.chuangjiangx.com/ter/";
  // 测试
//  var _baseUrl = "http://test.gas.ter.chuangjiangx.com/";
  var _baseUrl = "http://gas.ter.chuangjiangyun.com/";

  Dio _dio = Dio();

  API() {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    );

    // 添加拦截器
    _dio.interceptors.add(HeaderInterceptors());
  }

  /// get请求接口
  /// [path] 请求路径
  /// [params] 请求参数
  Future<ResponseBean> get(path, {params}) {
    return _handleRequest(() => _dio.get(
          path,
          queryParameters: params,
        ));
  }

  /// post请求接口
  /// [path] 请求路径
  /// [params] 请求参数
  /// [data] 数据
  Future<ResponseBean> post(path, {params, data}) {
    return _handleRequest(() => _dio.post(
          path,
          data: data,
          queryParameters: params,
        ));
  }

  /// 处理请求结果
  Future<ResponseBean> _handleRequest(func) async {
    Response response;
    try {
      response = await func();
    } on DioError catch (e) {
      return _handleError(e);
    }

    if (response.data is DioError) {
      return _handleError(response.data);
    }

    // 返回数据
    return ResponseBean.fromJSON(response.data);
  }

  /// 处理异常
  ResponseBean _handleError(DioError e) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = -1;
    }

    return ResponseBean(
      errorResponse.statusCode.toString(),
      "",
      false,
      errorResponse.data,
    );
  }
}

final API api = new API();
