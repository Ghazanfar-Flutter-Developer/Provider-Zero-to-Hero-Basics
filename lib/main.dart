import 'package:counter_app/pages/login_screen.dart';
import 'package:counter_app/provider/auth_provider.dart';
import 'package:counter_app/provider/count_provider.dart';
import 'package:counter_app/provider/example_one_provider.dart';
import 'package:counter_app/provider/favorite_provider.dart';
import 'package:counter_app/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChangerProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Consumer<ThemeChangerProvider>(
        builder: (context, ThemeChangerProvider notifier, child) {
          return MaterialApp(
            title: 'Counter Provider demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.deepPurple,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.amber,
              ),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
