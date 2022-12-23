import 'package:flutter_riverpod/flutter_riverpod.dart';

const stepData = [
  {
    'title': 'Step 1',
    'active': 1,
    'imgURL': 'assets/expanding_cards.gif',
  },
  {
    'title': 'Step 2',
    'active': 0,
    'imgURL': 'assets/expanding_cards.gif',
  },
  {
    'title': 'Step 3',
    'active': 0,
    'imgURL': 'assets/expanding_cards.gif',
  },
  {
    'title': 'Step 4',
    'active': 0,
    'imgURL': 'assets/expanding_cards.gif',
  },
  {
    'title': 'Step 5',
    'active': 0,
    'imgURL': 'assets/expanding_cards.gif',
  },
];

class MyStep {
  final String title;
  final bool active;
  final String imgURL;

  MyStep({required this.title, required this.active, required this.imgURL});

  MyStep copyWith({String? title, bool? active, String? imgURL}) {
    return MyStep(
      title: title ?? this.title,
      active: active ?? this.active,
      imgURL: imgURL ?? this.imgURL,
    );
  }
}

class MyStepState {
  final List<MyStep> steps;
  MyStepState({required this.steps});

  MyStepState copyWith({List<MyStep>? steps}) {
    return MyStepState(steps: steps ?? this.steps);
  }
}

final stepsProvider = StateNotifierProvider<MyStepNotifier, MyStepState>(
    (ref) => MyStepNotifier());

class MyStepNotifier extends StateNotifier<MyStepState> {
  MyStepNotifier() : super(MyStepState(steps: [])) {
    generateDemoList();
  }
  generateDemoList() {
    final steps = List<MyStep>.empty(growable: true);

    for (final demoJson in stepData) {
      steps.add(MyStep(
          title: demoJson['title'] as String,
          imgURL: demoJson['imgURL'] as String,
          active: (demoJson['active'] as int) == 1 ? true : false));
    }
    state = state.copyWith(steps: steps);
  }

  prevNextStep(MyStep stepClicked) {
    final steps = List<MyStep>.empty(growable: true);
    for (var step in state.steps) {
      if (step == stepClicked) {
        steps.add(step.copyWith(active: !step.active));
      } else {
        steps.add(step.copyWith(active: false));
      }
      state = state.copyWith(steps: steps);
    }
  }
}
