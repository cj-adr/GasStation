import 'models/order/order_list_entity.dart';
import 'models/order/order_refund_list_entity.dart';
import 'models/record/record_item_entity.dart';
import 'models/record/record_list_entity.dart';
import 'models/record/record_detail_entity.dart';
import 'models/user/role_entity.dart';
import 'models/user/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "OrderListBean") {
      return OrderListBean.fromJson(json) as T;
    } else if (T.toString() == "OrderRefundListBean") {
      return OrderRefundListBean.fromJson(json) as T;
    } else if (T.toString() == "RecordItemEntity") {
      return RecordItemEntity.fromJson(json) as T;
    } else if (T.toString() == "RecordListEntity") {
      return RecordListEntity.fromJson(json) as T;
    } else if (T.toString() == "RecordDetailEntity") {
      return RecordDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "RoleEntity") {
      return RoleEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
