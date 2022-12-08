import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'expanding_cards_data.dart';
import 'package:simple_animations/simple_animations.dart';

class ExpandingCards extends StatefulWidget {
  const ExpandingCards({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpandingCardsState createState() => _ExpandingCardsState();
}

class _ExpandingCardsState extends State<ExpandingCards> {
  final cards = List<MyCard>.empty(growable: true);

  @override
  initState() {
    super.initState();
    for (var cardJson in cardData) {
      cards.add(MyCard(
          expanded: cardJson['expanded'] as bool,
          title: cardJson['title'] as String,
          imgURL: cardJson['imgURL'] as String));
    }
  }

  collapseAndExpand(MyCard cardClicked) {
    for (var card in cards) {
      if (card == cardClicked) {
        card.expanded = !card.expanded;
      } else {
        card.expanded = false;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanding Cards'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, position) {
                final card = cards[position];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () => collapseAndExpand(card),
                    child: AnimatingCard(context, card),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget AnimatingCard(BuildContext context, MyCard card) {
    return CustomAnimationBuilder<double>(
      tween: Tween(begin: 80, end: 250), // define tween
      control: card.expanded
          ? Control.play
          : Control.playReverse, // bind variable with control instruction
      duration: const Duration(milliseconds: 500), // define duration
      builder: (context, value, _) {
        return imgCard(context, card, value);
      },
    );
  }

  Widget imgCard(BuildContext context, MyCard card, double width) {
    return Container(
      width: width, //card.expanded ? 250 : 80,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Colors.green,
        image: DecorationImage(
          image: Image.network(card.imgURL).image,
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 2,
            bottom: 40,
            child: Text(
              card.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
