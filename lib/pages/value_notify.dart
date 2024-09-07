import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueNotify extends StatelessWidget {
  ValueNotify({super.key});

  final ValueNotifier<int> _counte = ValueNotifier<int>(0);

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateLess Widget"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(
                        toggle.value ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
            Center(
              child: ValueListenableBuilder(
                valueListenable: _counte,
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counte.value++;
          print(_counte.toString());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
