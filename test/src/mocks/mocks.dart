import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/generate_order_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_all_orders_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue_usecase.dart';
import 'package:queue_intellij/src/queue/infra/datasource/queeu_datasource_interface.dart';
import 'package:queue_intellij/src/queue/infra/repositories/queue_repository.dart';

class IQueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueRepositoryMock extends Mock implements QueueRepository {}

class QueueEntityMock extends Mock implements QueeuEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

class IGetAllQueuesMock extends Mock implements IGetAllQueuesUsecase {}

class IAddNewQueusMock extends Mock implements IAddNewQueueUsecase {}

class IRemoveQueusMock extends Mock implements IRemoveQueuesUsecase {}

class IRemoveAllOrdersMock extends Mock implements IRemoveAllOrdersUsecase {}

class IGenerateOrderUsecaseMock extends Mock implements IGenerateOrderUsecase{}
