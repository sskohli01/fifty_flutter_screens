const demoData = [
  {
    'title': 'Expanding Cards',
    'imgURL': 'assets/expanding_cards.gif',
    'route_name': 'expanding_cards'
  },
];

class MyDemo {
  final String title;
  //bool expanded;
  final String imgURL;
  final String routeName;

  MyDemo({required this.title, required this.imgURL, required this.routeName});

  static List<MyDemo> demoEntries = generateDemoList();

  static List<MyDemo> generateDemoList() {
    final demos = List<MyDemo>.empty(growable: true);

    for (final demoJson in demoData) {
      demos.add(MyDemo(
          title: demoJson['title'] as String,
          imgURL: demoJson['imgURL'] as String,
          routeName: demoJson['route_name'] as String));
    }
    return demos;
  }
}
