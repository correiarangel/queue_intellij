import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_all_orders_usecase.dart';

import '../../../mocks/mocks.dart';

void main() {
  late IQueueRepository repository;

  setUpAll(() {
    debugPrint('Iniciando Suite testes RemoveAllOrders');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    repository = IQueueRepositoryMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes RemoveAllOrders');
  });
  test(
    'Deve completar o Future ao remover a propriedade orders...',
    () async {
      when(() => repository.removeAllOrders()).thenAnswer(
        (_) => Future.value(),
      );

      final usercase = RemoveAllOrdersUsecase(repository);

      expect(usercase.call(), completes);
    },
  );
}
