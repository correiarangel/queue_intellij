import '../repositories/queue_repository_interface.dart';

abstract class IRemoveAllOrdersUsecase {
  Future<void> call();
}

class RemoveAllOrdersUsecase implements IRemoveAllOrdersUsecase {
  IQueueRepository repository;
  RemoveAllOrdersUsecase(this.repository);

  @override
  Future<void> call() async {
    await repository.removeAllOrders();
  }
}
