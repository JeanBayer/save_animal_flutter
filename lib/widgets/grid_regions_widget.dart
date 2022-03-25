import 'package:app_save_animals/screens/animals_region_screen.dart';
import 'package:app_save_animals/widgets/animal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_save_animals/providers/animals.dart';

class GridRegionsWidgets extends StatelessWidget {
  final List data;
  final bool withScroll;
  final ValueChanged onPressed;
  const GridRegionsWidgets({
    Key? key,
    required this.data,
    required this.withScroll,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: withScroll ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 3 / 2,
      ),
      itemCount: data.length,
      itemBuilder: (ctx, i) {
        return GestureDetector(
          child: AnimalCardWidget(name: data[i].name),
          onTap: () {
            onPressed(data[i]);
          },
        );
      },
    );
  }
}
