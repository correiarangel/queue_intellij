import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue.dart';
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
  Provider<IGetAllQueues>(
    create: (context) => GetAllQueues(context.read()),
  ),
  Provider<IAddNewQueus>(create: (context) => AddNewQueue(context.read())),
  Provider<IRemoveQueues>(create: (context) => RemoveQueues(context.read())),
];
