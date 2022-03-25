import 'package:flutter/material.dart';

import 'package:app_save_animals/widgets/information_card_widget.dart';

class CarrouselHeaderWidget extends StatelessWidget {
  const CarrouselHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            InformationCardWidget(
              title: "Habitat Loss",
              parrafo:
                  "The loss and deterioration of habitats is the main cause of biodiversity loss. By transforming jungles, forests, thickets, grasslands, mangroves, lagoons, and reefs into agricultural fields, ranchers, shrimp farms, dams, highways, and urban areas, we destroy the habitat of thousands of species.",
              imageUrl:
                  "https://images.pexels.com/photos/6249809/pexels-photo-6249809.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            ),
            InformationCardWidget(
              title: "Overexplotation",
              parrafo:
                  "Overexploitation is the removal of individuals from a population at a rate greater than their reproduction. When this happens the population decreases. This has been the history of many of the species that have been exploited for different reasons: whales, fish, deer, cacti, orchids.",
              imageUrl:
                  "https://images.pexels.com/photos/10622724/pexels-photo-10622724.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            ),
            InformationCardWidget(
              title: "Pollution",
              parrafo:
                  "Industrial, agricultural, livestock and urban activities contribute substantially to the air, water and soil pollution. Some pollutants have weakened the ozone layer that protects living beings from radiation ultraviolet radiation from the Sun, while others have caused global warming. Water Pollution, of soil and air directly affects many organisms even in remote places.",
              imageUrl:
                  "https://images.pexels.com/photos/2768961/pexels-photo-2768961.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            ),
          ],
        ),
      ),
    );
  }
}
