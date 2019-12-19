import '../entity_factory.dart';

class ListEntity {
  int total;
  List items;

  ListEntity({this.total, this.items});

  ListEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    items = json['items'];
  }

  List<T> parseItems<T>() {
    if (null == items) {
      return [];
    }

    return items.map((v) => EntityFactory.generateOBJ<T>(v)).toList();
  }
}
