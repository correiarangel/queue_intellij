import '../entities/queue_entities.dart';
import '../repositories/queue_repository_interface.dart';

abstract class IUpdateQueueUsecase {
  Future<void> call(QueeuEntity queeuEntity);
}

class UpdateQueueUsecase implements IUpdateQueueUsecase {
  final IQueueRepository repository;

  UpdateQueueUsecase(this.repository);
  @override
  Future<void> call(QueeuEntity queeuEntity) async {
    repository.updateQueue(queeuEntity);
  }
}
