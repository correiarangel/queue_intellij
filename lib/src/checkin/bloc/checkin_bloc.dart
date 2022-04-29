import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/usecases/generate_order_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/update_queeu.dart';
import '../../queue/domain/usecases/get_all_queues_usecase.dart';
import '../event/checkin_event.dart';
import '../state/checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final IGetAllQueuesUsecase getAllQueues;
  final IGenerateOrderUsecase generateOrderUsecase;
  final IUpdateQueueUsecase updateQueueUsecase;
  CheckinBloc(
      this.getAllQueues, this.generateOrderUsecase, this.updateQueueUsecase)
      : super(InitialChecinState()) {
    on<FatchAllQueuesEvent>(_fetchQueues);
    on<PrintOrderEvent>(_printOrder);
    on<GenerateOrderEvent>(_generateOrder);
  }

  void _fetchQueues(event, Emitter emit) async {
    emit(LoadingChecinState());
    await emit.onEach<List<QueeuEntity>>(getAllQueues.call(), onData: (queues) {
      emit(SuccessChecinState(queues));
    }, onError: (err, st) {
      emit(ExceptionChecinState(err.toString()));
    });
  }

  void _printOrder(event, Emitter emitter) {}
  void _generateOrder(event, Emitter emitter) async {
    final queue = generateOrderUsecase.call(event.queeuEntity);
    final order = queue.orders.last;
    await updateQueueUsecase.call(queue);

    emitter(GenerateOrderCheckinState(order));
  }
}
