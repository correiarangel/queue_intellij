import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';

abstract class ConfigurationEvent {}

class FetchQueuesEvent implements ConfigurationEvent {}

class AddNewQueuesEvent implements ConfigurationEvent {
  final QueeuEntity queeuEntity;

  AddNewQueuesEvent(this.queeuEntity);
}

class RemoveQueuesEvent implements ConfigurationEvent {
  final QueeuEntity queeuEntity;

  RemoveQueuesEvent(this.queeuEntity);
}
class RemoveAllOrderEvent implements ConfigurationEvent {}
