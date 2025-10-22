import 'package:cinmash/features/app/home/widgets/ressource_card.dart';
import 'package:flutter/material.dart';

class RessourceList extends StatelessWidget {
  const RessourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return RessourceCard();
      },
    );
  }
}
