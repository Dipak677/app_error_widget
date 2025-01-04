import 'package:flutter/material.dart';

/// A widget that displays an error message with customizable styles.
///
/// The [AppErrorWidget] is designed to show an error header and exception
/// text. You can customize the header, the exception text style, the
/// background color, and the header text style.
///
/// You can provide custom text styles for both the header and the exception
/// message, or use the default styles. The widget ensures the error is displayed
/// in a visually distinct manner for a better user experience.
///
/// Properties:
/// - [headerText]: The text to display in the header. Defaults to "Error!" if not provided.
/// - [headerTextStyle]: The style for the header text. Defaults to a white, bold text style.
/// - [exceptionText]: The text that describes the exception or error. This is a required field.
/// - [exceptionTextStyle]: The style for the exception text. Defaults to black, normal-weight text style.
/// - [backgroundColor]: The background color for the widget. Defaults to a green color if not provided.
class AppErrorWidget extends StatelessWidget {
  /// The text to display in the header.
  /// Defaults to "Error!" if not provided.
  final String? headerText;

  /// The style for the header text.
  /// Defaults to a white, bold text style.
  final TextStyle? headerTextStyle;

  /// The text that describes the exception or error. This is a required field.
  final String exceptionText;

  /// The style for the exception text.
  /// Defaults to black, normal-weight text style.
  final TextStyle? exceptionTextStyle;

  /// The background color for the widget.
  /// Defaults to a green color if not provided.
  final Color? backgroundColor;

  /// The main widget name
  const AppErrorWidget({
    super.key,
    required this.exceptionText,
    this.exceptionTextStyle,
    this.headerText,
    this.headerTextStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        color: backgroundColor ?? const Color(0xFF38C071),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\u26A0 ${headerText ?? "Error!"}",
                textAlign: TextAlign.center,
                style: headerTextStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                exceptionText,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: exceptionTextStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
