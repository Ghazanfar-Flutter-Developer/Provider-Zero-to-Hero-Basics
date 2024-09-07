import 'package:counter_app/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExmapleOne extends StatefulWidget {
  const ExmapleOne({super.key});

  @override
  State<ExmapleOne> createState() => _ExmapleOneState();
}

class _ExmapleOneState extends State<ExmapleOne> {
  double value = 1.0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colors"),
        centerTitle: true,
        backgroundColor: Colors.limeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0.0,
                max: 1.0,
                activeColor: Colors.teal.shade900,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.lime.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text("shape 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text("shape 2"),
                    ),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
