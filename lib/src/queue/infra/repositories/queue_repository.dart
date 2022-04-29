import '../../domain/entities/queue_entities.dart';
import '../../domain/repositories/queue_repository_interface.dart';
import '../datasource/queeu_datasource_interface.dart';

import '../adapter/json_to_queue.dart';

class QueueRepository implements IQueueRepository {
  final IQueueDatasource datasource;

  QueueRepository(this.datasource);
  @override
  Stream<List<QueeuEntity>> getAllQueues() {
    final strean = datasource.getAllQueues();
    return strean.map(_convert);
  }

  List<QueeuEntity> _convert(List<Map> list) {
    return list.map(JsonToQueue.fronMap).toList();
  }

  @override
  Future<void> addQueue(QueeuEntity queue) async {
    var map = JsonToQueue.toMap(queue);
    await datasource.addQueue(map);
  }

  @override
  Future<void> removeQueue(String id) async {
    await datasource.removeQueue(id);
  }

  @override
  Future<void> removeAllOrders() async {
    await datasource.removeAllOrders();
  }

  @override
  Future<void> updateQueue(QueeuEntity queeuEntity) async {

    await datasource.updateQueue(JsonToQueue.toMap(queeuEntity));
  }
}
