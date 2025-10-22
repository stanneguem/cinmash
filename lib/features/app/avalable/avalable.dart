import 'package:flutter/material.dart';

import '../home/widgets/projet_cards.dart';

class Avalable extends StatelessWidget {
  const Avalable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProjetCards();
        },
      ),
    );
  }
}
