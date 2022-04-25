import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../queue/domain/entities/queue_entities.dart';
import '../../queue/domain/usecases/add_new_queue.dart';
import '../../queue/domain/usecases/get_all_queues.dart';
import '../../queue/domain/usecases/remove_queue.dart';
import '../state/configuration_event.dart';
import '../state/configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllQueuesUsecase;
  final IAddNewQueus addNewQueus;
  final IRemoveQueues removeQueues;

  ConfigurationBloc(
    this.getAllQueuesUsecase,
    this.addNewQueus,
    this.removeQueues,
  ) : super(EmpyConfigurationState()) {
    on<FetchQueuesEvent>(_fetchQueues, transformer: restartable());
    on<AddNewQueuesEvent>(_addNewQueues, transformer: sequential());
    on<RemoveQueuesEvent>(_removeQueues, transformer: sequential());
  }

  Future<void> _removeQueues(
      RemoveQueuesEvent event, Emitter<ConfigurationState> emit) async {
    await removeQueues.call(event.queeuEntity);
  }

  Future<void> _addNewQueues(
      AddNewQueuesEvent event, Emitter<ConfigurationState> emit) async {
    await addNewQueus.call(event.queeuEntity);
  }

  Future<void> _fetchQueues(event, emit) async {
    emit(LoadingConfigurationState());
    await emit.onEach<List<QueeuEntity>>(
      getAllQueuesUsecase.call(),
      onData: (queues) {
        emit(LoadedConfigurationState(queues));
      },
    );
  }
}
