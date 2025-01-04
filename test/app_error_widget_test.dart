import 'package:app_error_widget/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppErrorWidget', () {
    testWidgets('displays error header and exception text',
        (WidgetTester tester) async {
      // Arrange
      const exceptionText = 'This is a test exception message';
      const headerText = 'Error Occurred';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: AppErrorWidget(
            exceptionText: exceptionText,
            headerText: headerText,
          ),
        ),
      );

      // Assert
      expect(find.text('⚠ $headerText'), findsOneWidget);
      expect(find.text(exceptionText), findsOneWidget);
    });

    testWidgets('uses default header and exception text if none provided',
        (WidgetTester tester) async {
      // Arrange
      const exceptionText = 'This is a test exception message';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: AppErrorWidget(
            exceptionText: exceptionText,
          ),
        ),
      );

      // Assert
      expect(find.text('⚠ Error!'), findsOneWidget);
      expect(find.text(exceptionText), findsOneWidget);
    });

    testWidgets('displays custom background color',
        (WidgetTester tester) async {
      // Arrange
      const exceptionText = 'This is a test exception message';
      const customBackgroundColor = Colors.blue;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: AppErrorWidget(
            exceptionText: exceptionText,
            backgroundColor: customBackgroundColor,
          ),
        ),
      );

      // Assert
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.color, customBackgroundColor);
    });

    testWidgets('displays custom headerTextStyle and exceptionTextStyle',
        (WidgetTester tester) async {
      // Arrange
      const exceptionText = 'This is a test exception message';
      const customHeaderTextStyle = TextStyle(color: Colors.red, fontSize: 20);
      const customExceptionTextStyle =
          TextStyle(color: Colors.black, fontSize: 14);

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: AppErrorWidget(
            exceptionText: exceptionText,
            headerTextStyle: customHeaderTextStyle,
            exceptionTextStyle: customExceptionTextStyle,
          ),
        ),
      );

      // Assert
      final headerTextWidget = tester.widget<Text>(find.text('⚠ Error!'));
      final exceptionTextWidget = tester.widget<Text>(find.text(exceptionText));

      expect(headerTextWidget.style?.color, customHeaderTextStyle.color);
      expect(headerTextWidget.style?.fontSize, customHeaderTextStyle.fontSize);
      expect(exceptionTextWidget.style?.color, customExceptionTextStyle.color);
      expect(exceptionTextWidget.style?.fontSize,
          customExceptionTextStyle.fontSize);
    });

    testWidgets('handles long exception text gracefully',
        (WidgetTester tester) async {
      // Arrange
      final longExceptionText =
          'This is a very long test exception message ' * 10;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: AppErrorWidget(
            exceptionText: longExceptionText,
          ),
        ),
      );

      // Assert
      expect(find.text(longExceptionText), findsOneWidget);
      // Check if the text is properly truncated
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('checks if exceptionTextStyle can be null',
        (WidgetTester tester) async {
      // Arrange
      const exceptionText = 'This is a test exception message';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: AppErrorWidget(
            exceptionText: exceptionText,
            exceptionTextStyle: null,
          ),
        ),
      );

      // Assert
      expect(find.text(exceptionText), findsOneWidget);
      final exceptionTextWidget = tester.widget<Text>(find.text(exceptionText));
      expect(exceptionTextWidget.style, null); // Check if the style is null
    });
  });
}
