import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/value_objects/order.dart';

abstract class CheckinEvent {}

class FatchAllQueuesEvent implements CheckinEvent {}

class PrintOrderEvent implements CheckinEvent {
  final Order order;

  PrintOrderEvent(this.order);
}

class GenerateOrderEvent implements CheckinEvent {
  final QueeuEntity queueEntity;

  GenerateOrderEvent(this.queueEntity);
}
