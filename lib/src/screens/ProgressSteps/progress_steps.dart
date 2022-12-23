import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indexed/indexed.dart';
import 'progress_steps_viewmodel.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenNameProvider = Provider<String>((_) => 'Progress Steps');

class MyProgressSteps extends ConsumerWidget {
  const MyProgressSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MyStep> steps = ref.watch(stepsProvider).steps;

    // use ref.watch() to get the value of the provider
    final screenName = ref.watch(screenNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('$screenName - ${steps[0].title}'), //'Progress Steps'
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Indexer(
                children: [
                  Indexed(
                    index: 10,
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: steps.length,
                        itemBuilder: (context, position) {
                          final step = steps[position];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () => ref
                                  .read(stepsProvider.notifier)
                                  .prevNextStep(step),
                              child: CircularStep(context, step),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Indexed(
                    index: 1,
                    child: Positioned(
                        left: 70,
                        top: 100,
                        child: Container(
                          width: 320,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.yellow[300],
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  TextButton(onPressed: null, child: Text('< Prev')),
                  SizedBox(width: 40),
                  TextButton(onPressed: null, child: Text('Next >')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CircularStep(BuildContext context, MyStep step) {
    return CustomAnimationBuilder<double>(
      tween: Tween(begin: 30, end: 32), // define tween
      control: step.active
          ? Control.play
          : Control.playReverse, // bind variable with control instruction
      duration: const Duration(milliseconds: 300), // define duration
      builder: (context, value, _) {
        return CircleAvatar(
          backgroundColor: Colors.red,
          radius: value,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Text(
              step.title,
              style: TextStyle(color: Colors.green[300]),
            ),
          ),
        );
      },
    );
  }
}
