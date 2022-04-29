import '../entities/queue_entities.dart';
import '../repositories/queue_repository_interface.dart';

abstract class IGetAllQueuesUsecase {
  Stream<List<QueeuEntity>> call();
}

class GetAllQueuesUsecase implements IGetAllQueuesUsecase {
  final IQueueRepository repository;

  GetAllQueuesUsecase(this.repository);
  @override
  Stream<List<QueeuEntity>> call() {
    return repository.getAllQueues();
  }
}
