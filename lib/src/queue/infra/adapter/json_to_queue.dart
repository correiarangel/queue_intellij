import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/infra/adapter/json_to_order.dart';

class JsonToQueue {
  static QueeuEntity fronMap(Map json) {
    return QueeuEntity(
      id: json['id'],
      title: json['title'],
      priority: json['priority'],
      abbreviation: json['abbreviation'],
      orders: [
        if (json.containsKey('orders'))
          ...(json['orders']).map(JsonToOrder.fronMap).toList(),
      ],
    );
  }

  static Map<String,dynamic> toMap(QueeuEntity queue) {
    return {
      'id': queue.id,
      'title': queue.title,
      'priority': queue.priority,
      'abbreviation': queue.abbreviation,
      'orders':
          queue.orders.map((order) => JsonToOrder.fronMap(order)).toList(),
    };
  }
}
