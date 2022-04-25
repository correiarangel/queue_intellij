import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_intellij/src/queue/domain/value_objects/order.dart';
import 'package:queue_intellij/src/queue/infra/adapter/json_to_order.dart';

void main() {
  final order = Order(
    id: 'a1a2a3s4',
    position: 1,
    status: OrderStatus.wainting,
    timestamp: DateTime.now(),
  );
  setUpAll(() {
    debugPrint('Iniciando Suite testes JsonToOrder');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes JsonToOrder');
  });
  test('Deve converter um Map em um objeto Order ...', () async {
    final order = JsonToOrder.fronMap({
      'id': '123rewer',
      'position': 1,
      'status': 'attending',
      'timestamp': '2022-04-18 18:37:25',
    });

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });


  test('Deve converter um Order em Map', () {
    final map = JsonToOrder.toMap(order);
    expect(map, isA<Map<String, dynamic>>());
    expect(map['id'], 'a1a2a3s4');
  });

  test('O Map convertido deve conter id igual a1a2a3s4', () {
    final map = JsonToOrder.toMap(order);
    expect(map['id'], 'a1a2a3s4');
  });
}
