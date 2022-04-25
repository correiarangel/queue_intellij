import '../entities/queue_entities.dart';
import '../repositories/queue_repository_interface.dart';

abstract class IGetAllQueues {
  Stream<List<QueeuEntity>> call();
}

class GetAllQueues implements IGetAllQueues {
  final IQueueRepository repository;

  GetAllQueues(this.repository);
  @override
  Stream<List<QueeuEntity>> call() {
    return repository.getAllQueues();
  }
}
