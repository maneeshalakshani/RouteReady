// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:route_ready/controllers/journey_functions.dart';

void main() {
  testWidgets('Invalid QR Validity', (WidgetTester tester) async {
    // Build a widget and trigger a frame.
    await tester.pumpWidget(MyWidget());
    final BuildContext context = tester.element(find.text('YourWidgetText'));
    const isEndOfJourney = false;
    const qrData = 'sdkjUUYTKJUWde3';

    final result = qrValidity(qrData: qrData, context: context, isEndOfJourney: isEndOfJourney);
    expect(result, false);
  });

  testWidgets('Valid QR Validity', (WidgetTester tester) async {
    // Build a widget and trigger a frame.
    await tester.pumpWidget(MyWidget());
    final BuildContext context = tester.element(find.text('YourWidgetText'));
    const isEndOfJourney = false;
    const qrData = 'ID: kdmfv234kG';

    final result = qrValidity(qrData: qrData, context: context, isEndOfJourney: isEndOfJourney);
    expect(result, true);
  });
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('YourWidgetText'),
        ),
      ),
    );
  }
}

