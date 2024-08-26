import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:razorerp_weather_app/presentation/widgets/error_view.dart';

void main() {
  testWidgets('ErrorView displays the error message', (WidgetTester tester) async {
    const errorMessage = 'Test error message';

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorView(message: errorMessage),
        ),
      ),
    );

    // Verify that the error message is displayed.
    expect(find.text(errorMessage), findsOneWidget);

    // Verify that the text is centered.
    expect(find.byType(Center), findsOneWidget);

    // Verify that the text color is red.
    final textWidget = tester.widget<Text>(find.text(errorMessage));
    expect(textWidget.style?.color, Colors.red);
  });
}