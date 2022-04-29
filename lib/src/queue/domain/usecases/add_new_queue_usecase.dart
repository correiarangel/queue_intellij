import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';

abstract class IAddNewQueueUsecase {
  Future<void> call(QueeuEntity queue);
}

class AddNewQueueUsecase implements IAddNewQueueUsecase {
  final IQueueRepository repository;

  AddNewQueueUsecase(this.repository);

  @override
  Future<void> call(QueeuEntity queue) async {
    return await repository.addQueue(queue);
  }
}
