import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';

abstract class IRemoveQueuesUsecase {
  Future<void> call(QueeuEntity queeuEntity);
}

class RemoveQueuesUsecase implements IRemoveQueuesUsecase {
  final IQueueRepository repository;

  RemoveQueuesUsecase(this.repository);

  @override
  Future<void> call(QueeuEntity queeuEntity) async {
    await repository.removeQueue(queeuEntity.id);
  }
}
