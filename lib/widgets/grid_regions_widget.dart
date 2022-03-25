import 'package:app_save_animals/screens/animals_region_screen.dart';
import 'package:app_save_animals/widgets/animal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_save_animals/providers/animals.dart';

class GridRegionsWidgets extends StatelessWidget {
  final Animals data;
  // final bool withScroll;
  const GridRegionsWidgets({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        physics: true ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        //const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 3 / 2,
        ),
        itemCount: data.region.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            child: AnimalCardWidget(name: data.region[i].name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => AnimalsRegionScreen(
                    region: data.region[i],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
