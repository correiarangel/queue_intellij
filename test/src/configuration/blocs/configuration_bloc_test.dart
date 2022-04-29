import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue_intellij/src/configuration/event/configuration_event.dart';
import 'package:queue_intellij/src/configuration/state/configuration_state.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_all_orders_usecase.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue_usecase.dart';
import '../../mocks/mocks.dart';

void main() {
  late IGetAllQueuesUsecase usecaseGet;
  late IAddNewQueueUsecase usecaseAdd;
  late IRemoveQueuesUsecase usecaseRem;
  late QueeuEntity queeuEntity;
  late IRemoveAllOrdersUsecase removeAllOrders;
  setUpAll(() {
    debugPrint('Iniciando Suite testes ConfigurationBloc');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    usecaseGet = IGetAllQueuesMock();
    usecaseAdd = IAddNewQueusMock();
    usecaseRem = IRemoveQueusMock();
    queeuEntity = QueueEntityMock();
    removeAllOrders = IRemoveAllOrdersMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes ConfigurationBloc');
  });
  group('Caminho Feliz ;]', () {
    blocTest<ConfigurationBloc, ConfigurationState>(
      'Deve retornar estados  LoadingConfigurationState, LoadedConfigurationState ...',
      build: () {
        when(() => usecaseGet.call())
            .thenAnswer((invocation) => Stream.value([]));
        return ConfigurationBloc(
          usecaseGet,
          usecaseAdd,
          usecaseRem,
          removeAllOrders,
        );
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
        return ConfigurationBloc(
          usecaseGet,
          usecaseAdd,
          usecaseRem,
          removeAllOrders,
        );
      },
      act: (bloc) => bloc.add(AddNewQueuesEvent(queeuEntity)),
      expect: () => [],
    );

    blocTest<ConfigurationBloc, ConfigurationState>(
      'Deve remover um QueeuEntity ...',
      build: () {
        when(() => usecaseRem.call(queeuEntity))
            .thenAnswer((_) => Future.value());
        return ConfigurationBloc(
          usecaseGet,
          usecaseAdd,
          usecaseRem,
          removeAllOrders,
        );
      },
      act: (bloc) => bloc.add(RemoveQueuesEvent(queeuEntity)),
      expect: () => [],
    );

    blocTest<ConfigurationBloc, ConfigurationState>(
      'Deve remover Orders ...',
      build: () {
        when(() => removeAllOrders.call()).thenAnswer((_) => Future.value());
        return ConfigurationBloc(
          usecaseGet,
          usecaseAdd,
          usecaseRem,
          removeAllOrders,
        );
      },
      act: (bloc) => bloc.add(RemoveAllOrderEvent()),
      expect: () => [],
    );
  });

  group('Caminho Triste :[', () {
    blocTest<ConfigurationBloc, ConfigurationState>(
      'Deve retornar erro com estados'
      ' LoadingConfigurationState, ExceptionConfigurationState ...',
      build: () {
        when(() => usecaseGet.call())
            .thenAnswer((invocation) => Stream.error(Exception('ERROR ...!')));
        return ConfigurationBloc(
          usecaseGet,
          usecaseAdd,
          usecaseRem,
          removeAllOrders,
        );
      },
      act: (bloc) => bloc.add(FetchQueuesEvent()),
      expect: () => [
        isA<LoadingConfigurationState>(),
        isA<ExceptionConfigurationState>(),
      ],
    );
  });
}
