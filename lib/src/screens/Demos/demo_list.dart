import 'package:flutter/material.dart';
import 'demo_list_data.dart';
import 'demo_card.dart';
import 'package:go_router/go_router.dart';

class DemoList extends StatelessWidget {
  DemoList({Key? key}) : super(key: key);
  final demos = MyDemo.demoEntries;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demos'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: demos.length,
              itemBuilder: (context, position) {
                final demo = demos[position];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () => context.goNamed(demo.routeName),
                    child: DemoCard(demo: demo),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
