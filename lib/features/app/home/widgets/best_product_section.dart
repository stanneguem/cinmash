import 'package:cinmash/features/app/home/widgets/projet_cards.dart';
import 'package:cinmash/features/app/home/widgets/ressource_card.dart';
import 'package:cinmash/features/app/home/widgets/title_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestRessourcesSection extends StatelessWidget {
  const BestRessourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(texte: 'Les Ressources de confiance',),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 250.h,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return RessourceCard();
            },
          ),
        )
      ],
    );
  }
}
