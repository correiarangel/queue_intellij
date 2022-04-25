import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue_intellij/src/queue/infra/datasource/queeu_datasource_interface.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueeuEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}

class IAddNewQueusMock extends Mock implements IAddNewQueus {}

class IRemoveQueusMock extends Mock implements IRemoveQueues {}
