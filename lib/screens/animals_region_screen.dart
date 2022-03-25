import 'package:app_save_animals/models/region_model.dart';
import 'package:app_save_animals/providers/animals.dart';
import 'package:app_save_animals/widgets/animal_card_widget.dart';
import 'package:app_save_animals/widgets/grid_regions_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AnimalsRegionScreen extends StatefulWidget {
  final RegionModel region;
  const AnimalsRegionScreen({Key? key, required this.region}) : super(key: key);

  @override
  State<AnimalsRegionScreen> createState() => _AnimalsRegionScreenState();
}

class _AnimalsRegionScreenState extends State<AnimalsRegionScreen> {
  Future? _obtainedEarlier;
  void onPressed(value) {
    print("${value.name}");
  }

  Future _runFuture() async {
    return await Provider.of<Animals>(context, listen: false)
        .fetchAndSetAnimals(widget.region.id);
  }

  @override
  void initState() {
    super.initState();

    _obtainedEarlier = _runFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        title: Text(widget.region.name),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _obtainedEarlier,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else {
              return Consumer<Animals>(
                builder: (_, value, child) => GridRegionsWidgets(
                  data: value.animal,
                  withScroll: true,
                  onPressed: (value) {
                    onPressed(value);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
