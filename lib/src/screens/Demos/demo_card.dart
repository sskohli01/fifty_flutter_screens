import 'package:flutter/material.dart';
import 'demo_list_data.dart';

class DemoCard extends StatefulWidget {
  const DemoCard({Key? key, required this.demo}) : super(key: key);
  final MyDemo demo;
  @override
  State<DemoCard> createState() => _DemoCardState();
}

class _DemoCardState extends State<DemoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        // 4
        child: Column(
          children: <Widget>[
            /*Row(children: [
              const SizedBox(
                width: 30,
              ),
              IconButton(
                icon: faveDemos.containsKey(widget.Demo.name)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                tooltip: 'Add to favorites',
                onPressed: () {
                  setState(() {
                    if (faveDemos.containsKey(widget.Demo.name)) {
                      faveDemos.remove(widget.Demo.name);
                    } else {
                      faveDemos[widget.Demo.name] = 1;
                    }
                  });
                },
              ),
            ]),*/
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.demo.imgURL),
              ),
            ),
            // 5
            const SizedBox(
              height: 8,
            ),
            // 6
            Text(
              widget.demo.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
            // 5
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
