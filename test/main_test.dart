import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_application_complete/main.dart';

void main() {
  setUp(() => null);
  setUpAll(() => null);
  tearDown(() => null);
  tearDownAll(() => null);

  //setUpAll -> setUp -> testWidget -> tearDown() -> setUp -> testWidget2 -> tearTown -> tearDownAll

  group('Test Counter Text', () {
    testWidgets(
        'Given MyHomeTest When initialized Then must have a Text with 0',
        (widgetTester) async {
      //Inicializacion
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Test Widget'),
        ),
      );

      //Ejecucion
      final ctr = find.text('0');

      //Asercion
      expect(ctr, findsOneWidget);
    });

    testWidgets('Given MyHomeTest When initialized Then not have a Text with 1',
        (widgetTester) async {
      //Inicializacion
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Test Widget'),
        ),
      );

      //Ejecucion
      final ctr = find.text('1');

      //Asercion
      expect(ctr, findsNothing);
    });
  });

  group('Test Flaoting Action Button', () {
    testWidgets(
        'Given MyHomeTest When initialized Then must have a FloatingActionButton',
        (widgetTester) async {
      //Inicializacion
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Test Widget'),
        ),
      );

      //Ejecucion
      final floatingActionButton = find.byType(FloatingActionButton);
      await widgetTester.tap(floatingActionButton);

      await widgetTester.pump();

      final cnt = find.text('1');

      //Asercion
      expect(floatingActionButton, findsOneWidget);
      expect(cnt, findsOneWidget);
    });
  });
}
