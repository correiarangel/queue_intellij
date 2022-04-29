import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/generate_order_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_all_orders_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/update_queeu.dart';
import 'package:queue_intellij/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue_intellij/src/queue/infra/datasource/queeu_datasource_interface.dart';
import 'package:queue_intellij/src/queue/infra/repositories/queue_repository.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
    create: (context) => QueueFirestoreDatasource(context.read()),
  ),
  Provider<IQueueRepository>(
    create: (context) => QueueRepository(context.read()),
  ),
  Provider<IGetAllQueuesUsecase>(
    create: (context) => GetAllQueuesUsecase(context.read()),
  ),
  Provider<IAddNewQueueUsecase>(
      create: (context) => AddNewQueueUsecase(context.read())),
  Provider<IRemoveQueuesUsecase>(
      create: (context) => RemoveQueuesUsecase(context.read())),
  Provider<IRemoveAllOrdersUsecase>(
    create: (context) => RemoveAllOrdersUsecase(context.read()),
  ),
    Provider<IUpdateQueueUsecase>(
    create: (context) => UpdateQueueUsecase(context.read()),
  ),
  Provider<IGenerateOrderUsecase>(
    create: (context) => GenerateOrderUsecase(),
  ),
];
