import '../value_objects/order.dart';

class QueeuEntity {
  final String id;
  final String title;
  final String abbreviation;
  final int priority;
  final List<Order> orders;

  QueeuEntity({
    required this.id,
    required this.title,
    required this.abbreviation,
    required this.priority,
    required this.orders,
  });
}
