import 'package:app_error_widget/app_error_widget.dart';
import 'package:flutter/material.dart';

void main() {
  //APP-ERROR-UI--------------------------
  ErrorWidget.builder =
      (details) => AppErrorWidget(exceptionText: details.exception.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: AppErrorExample(),
    );
  }
}

class AppErrorExample extends StatelessWidget {
  const AppErrorExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Error UI"),
        backgroundColor: const Color(0xFF38C071),
        elevation: 7,
      ),
      body: const SizedBox(
        width: -10,
        height: 10,
      ),
    );
  }
}
