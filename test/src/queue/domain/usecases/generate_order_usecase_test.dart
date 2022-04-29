import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/usecases/generate_order_usecase.dart';


void main() {
  late IGenerateOrderUsecase generateOrderUsecase;
  setUpAll(() {
    debugPrint('Iniciando Suite testes GenerateOrderUsecase');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');

    generateOrderUsecase =  GenerateOrderUsecase();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes GenerateOrderUsecase');
  });
  test('Deve gerar  Order  ...', () async {

    final result = generateOrderUsecase.call(queeuEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);
  });
}

final queeuEntity = QueeuEntity(
  id: 'asasds',
  abbreviation: 'ABB',
  orders: [],
  priority: 1,
  title: 'title',
);


