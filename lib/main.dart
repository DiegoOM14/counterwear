import '../counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

// Navigator key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
        child: const CounterPage(),
        builder: (context, mode, child) {
          return MaterialApp(
            title: 'counter',
            theme: ThemeData(
                visualDensity: VisualDensity.compact,
                colorScheme: mode == WearMode.active
                    ? const ColorScheme.dark(
                        primary: Color.fromARGB(255, 255, 255, 255),
                      )
                    : const ColorScheme.dark(
                        primary: Color.fromARGB(232, 248, 243, 243),
                        onBackground: Color.fromARGB(176, 242, 240, 243),
                        onSurface: Color.fromARGB(226, 236, 233, 233),
                      )),
            home: child,
            navigatorKey: navigatorKey,
          );
        });
  }
}
