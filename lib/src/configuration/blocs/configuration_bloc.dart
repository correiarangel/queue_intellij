import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_all_orders_usecase.dart';

import '../../queue/domain/entities/queue_entities.dart';
import '../../queue/domain/usecases/add_new_queue_usecase.dart';
import '../../queue/domain/usecases/get_all_queues_usecase.dart';
import '../../queue/domain/usecases/remove_queue_usecase.dart';
import '../event/configuration_event.dart';
import '../state/configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueuesUsecase getAllQueuesUsecase;
  final IAddNewQueueUsecase addNewQueusUsecase;
  final IRemoveQueuesUsecase removeQueuesUsecase;
  final IRemoveAllOrdersUsecase removeOrdersUsecase;

  ConfigurationBloc(
    this.getAllQueuesUsecase,
    this.addNewQueusUsecase,
    this.removeQueuesUsecase,
    this.removeOrdersUsecase,
  ) : super(EmpyConfigurationState()) {
    on<FetchQueuesEvent>(_fetchQueues, transformer: restartable());
    on<AddNewQueuesEvent>(_addNewQueues, transformer: sequential());
    on<RemoveQueuesEvent>(_removeQueues, transformer: sequential());
    on<RemoveAllOrderEvent>(_removeAllOrders, transformer: droppable());
  }

  Future<void> _removeAllOrders(
      RemoveAllOrderEvent event, Emitter<ConfigurationState> emit) async {
    await removeOrdersUsecase.call();
  }

  Future<void> _removeQueues(
      RemoveQueuesEvent event, Emitter<ConfigurationState> emit) async {
    await removeQueuesUsecase.call(event.queeuEntity);
  }

  Future<void> _addNewQueues(
      AddNewQueuesEvent event, Emitter<ConfigurationState> emit) async {
    await addNewQueusUsecase.call(event.queeuEntity);
  }

  Future<void> _fetchQueues(event, Emitter emit) async {
    emit(LoadingConfigurationState());
    await emit.onEach<List<QueeuEntity>>(getAllQueuesUsecase.call(),
        onData: (queues) {
      emit(LoadedConfigurationState(queues));
    }, onError: (error, st) {
      emit(ExceptionConfigurationState(error.toString()));
    });
  }
}
