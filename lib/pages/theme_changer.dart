import 'package:counter_app/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        centerTitle: true,
      ),
      body: Consumer<ThemeChangerProvider>(
          builder: (context, ThemeChangerProvider notifier, child) {
        return Column(
          children: [
            ListTile(
              leading:
                  Icon(notifier.isDark ? Icons.light_mode : Icons.dark_mode),
              title: Text(notifier.isDark ? "Light Mode" : "Dark Mode"),
              trailing: Switch(
                value: notifier.isDark,
                onChanged: (value) {
                  notifier.changeTheme();
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
