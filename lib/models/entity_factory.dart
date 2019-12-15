import 'package:gas_station/models/test_entity.dart';

import 'record/record_detail_entity.dart';
import 'record/record_item_entity.dart';
import 'record/record_list_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "RecordItemEntity") {
      return RecordItemEntity.fromJson(json) as T;
    } else if (T.toString() == "RecordListEntity") {
      return RecordListEntity.fromJson(json) as T;
    } else if (T.toString() == "RecordDetailEntity") {
      return RecordDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "TestEntity") {
      return TestEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
