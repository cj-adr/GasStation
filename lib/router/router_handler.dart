import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterHandler extends Handler {
  RouterHandler(Func handlerFunc)
      : super(handlerFunc: _getHandlerFunc(handlerFunc));

  static HandlerFunc _getHandlerFunc(Func handlerFunc) {
    return (context, params) {
      if (params != null &&
          params['params'] != null &&
          params['params'].length > 0) {
        return handlerFunc(context, jsonDecode(params["params"][0]));
      } else {
        return handlerFunc(context, null);
      }
    };
  }
}

typedef Widget Func(BuildContext context, Map<String, Object> parameters);
