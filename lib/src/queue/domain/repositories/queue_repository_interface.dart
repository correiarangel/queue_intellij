import '../entities/queue_entities.dart';

abstract class IQueueRepository {
  Stream<List<QueeuEntity>> getAllQueues();

  Future<void> addQueue(QueeuEntity queeuEntity);

  Future<void> removeQueue(String id);
}
