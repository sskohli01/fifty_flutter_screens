import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final screenNameProvider = Provider<String>((_) => 'Rotating Navigation');

class BaseScreen extends ConsumerWidget {
  const BaseScreen({Key? key}) : super(key: key);
  //final List<MyStep> steps = ref.watch(stepsProvider).steps;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenName = ref.watch(screenNameProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(screenName),
        ),
      ),
      appBar: AppBar(
        title: Text(screenName), //'Rotating Navigation'
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
