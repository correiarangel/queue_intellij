import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';

abstract class IAddNewQueus {
  Future<void> call(QueeuEntity queue);
}

class AddNewQueue implements IAddNewQueus {
  final IQueueRepository repository;

  AddNewQueue(this.repository);

  @override
  Future<void> call(QueeuEntity queue) async {
    return await repository.addQueue(queue);
  }
}
