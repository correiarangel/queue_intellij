import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/value_objects/order.dart';

abstract class IGenerateOrderUsecase {
  QueeuEntity call(QueeuEntity queeuEntity);
}

class GenerateOrderUsecase extends IGenerateOrderUsecase {
  @override
  QueeuEntity call(QueeuEntity queeuEntity) {
    final orders = List<Order>.from(queeuEntity.orders);
    final totalOrders = orders.length;
    final order = Order(
      id:_generateId(totalOrders + 1),
      position: totalOrders + 1,
      timestamp: DateTime.now(),
      status: OrderStatus.wainting,
    );
    queeuEntity.orders.add(order);
    return queeuEntity;
  }

  String _generateId(int id) {
    return '$id'.padLeft(4, '0');
  }
}
