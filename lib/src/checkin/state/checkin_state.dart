import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';

import '../../queue/domain/value_objects/order.dart';

abstract class CheckinState {}

class LoadingChecinState implements CheckinState {}

class InitialChecinState implements CheckinState {}

class SuccessChecinState implements CheckinState {
  final List<QueeuEntity> queues;
  SuccessChecinState(this.queues);
}

/* class SuccessChecinWithState implements CheckinState {
  final Order order;
  SuccessChecinWithState(this.order);
}
 */
class GenerateOrderCheckinState implements CheckinState {
  final Order order;
  GenerateOrderCheckinState(this.order);
}

class ExceptionChecinState implements CheckinState {
  final String message;

  ExceptionChecinState(this.message);
}
