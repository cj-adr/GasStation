import 'dart:convert';

class RouterParams {
  final String path;
  Map<String, Object> params = Map();

  RouterParams(this.path);

  RouterParams put(String key, Object value) {
    params[key] = value;
    return this;
  }

  String toPath() {
    if (params.length == 0) {
      return path;
    } else {
      String json = jsonEncode(params);
      return path + "/" + json;
    }
  }
}
