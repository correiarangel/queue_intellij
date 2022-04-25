import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue_intellij/src/configuration/state/configuration_event.dart';
import 'package:queue_intellij/src/configuration/state/configuration_state.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue.dart';
import '../../mocks/mocks.dart';

void main() {
  late IGetAllQueues usecaseGet;
  late IAddNewQueus usecaseAdd;
  late IRemoveQueues usecaseRem;
  late QueeuEntity queeuEntity;
  setUpAll(() {
    debugPrint('Iniciando Suite testes ConfigurationBloc');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    usecaseGet = IGetAllQueuesMock();
    usecaseAdd = IAddNewQueusMock();
    usecaseRem = IRemoveQueusMock();
    queeuEntity = QueueEntityMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes ConfigurationBloc');
  });
  blocTest<ConfigurationBloc, ConfigurationState>(
    'Deve retornar estados  LoadingConfigurationState, LoadedConfigurationState ...',
    build: () {
      when(() => usecaseGet.call())
          .thenAnswer((invocation) => Stream.value([]));
      return ConfigurationBloc(usecaseGet, usecaseAdd, usecaseRem);
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<LoadedConfigurationState>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'Deve adicinar novo QueeuEntity ...',
    build: () {
      when(() => usecaseAdd.call(queeuEntity))
          .thenAnswer((_) => Future.value());
      return ConfigurationBloc(usecaseGet, usecaseAdd, usecaseRem);
    },
    act: (bloc) => bloc.add(AddNewQueuesEvent(queeuEntity)),
    expect: () => [],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'Deve remover um QueeuEntity ...',
    build: () {
      when(() => usecaseRem.call(queeuEntity))
          .thenAnswer((_) => Future.value());
      return ConfigurationBloc(usecaseGet, usecaseAdd, usecaseRem);
    },
    act: (bloc) => bloc.add(RemoveQueuesEvent(queeuEntity)),
    expect: () => [],
  );
}
