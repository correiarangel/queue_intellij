import 'package:flutter/cupertino.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/value_objects/order.dart';

@immutable
class QueueModel extends QueeuEntity {
  QueueModel({
    required String id,
    required String title,
    required String abbreviation,
    required int priority,
    required List<Order> orders,
  }) : super(
          id: id,
          title: title,
          abbreviation: abbreviation,
          priority: priority,
          orders: orders,
        );

  factory QueueModel.emppty() {
    return QueueModel(
      id: '',
      title: '',
      abbreviation: '',
      priority: 0,
      orders: const [],
    );
  }

  QueueModel copyWith(
      {String? id,
      String? title,
      String? abbreviation,
      int? priority,
      List<Order>? orders}) {
    return QueueModel(
      id: id ?? this.id,
      title: title ?? this.title,
      abbreviation: abbreviation ?? this.abbreviation,
      priority: priority ?? this.priority,
      orders: orders ?? this.orders,
    );
  }
}
