import 'package:gas_station/models/index.dart';
import 'package:gas_station/models/list_entity.dart';
import 'package:gas_station/models/login/code_entity.dart';
import 'package:gas_station/models/user/user_entity.dart';
import 'package:gas_station/network/api.dart';
import 'package:gas_station/network/response_bean.dart';
import 'package:gas_station/network/url_paths.dart';

class Services {

  static Future<ResponseBean<CodeEntity>> getCodeForLogin(String mobile) async{
    var body = {"mobile":mobile};
    var resp = await api.post<CodeEntity>(UrlPaths.CODE_LOGIN_PATH,data: body);

    return resp;
  }

  static Future<ResponseBean<UserEntity>> login(
      String mobile, String pwd) async {
    var body = {"mobile": mobile, "pwd": pwd, "loginType": "MOBILE_PWD"};
    var resp = await api.post<UserEntity>(UrlPaths.LOGIN_PATH, data: body);
    return resp;
  }

  static Future<List<RecordListEntity>> findWorkRecordList(
      int pageNO, int pageSize) async {
    var params = {"pageNO": pageNO, "pageSize": pageSize};
    var resp = await api.get<ListEntity>(UrlPaths.FIND_WORK_RECORD_LIST,
        params: params);

    print('${resp.errCode}, ${resp.errMsg}, ${resp.success}');
    if (resp.success) {
      var list = resp.data.parseItems<RecordListEntity>();
      return list;
    }

    return [];
  }

  static Future<RecordDetailEntity> getWorkRecordDetail(int id) async {
    var resp = await api.get<RecordDetailEntity>(
        UrlPaths.GET_WORK_RECORD_DETAIL + '/$id');

    print('${resp.errCode}, ${resp.errMsg}, ${resp.success}');
    if (resp.success) {
      return resp.data;
    }

    return null;
  }
}
