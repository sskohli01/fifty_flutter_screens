import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'progress_steps_viewmodel.dart';

class MyProgressSteps extends ConsumerWidget {
  MyProgressSteps({Key? key}) : super(key: key);
  final screenNameProvider = Provider<String>((_) => 'Progress Steps');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenName = ref.watch(screenNameProvider);
    final List<MyStep> steps = ref.watch(stepsProvider).steps;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(screenName),
        ),
      ),
      appBar: AppBar(
        title: Text('${steps.length}'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
