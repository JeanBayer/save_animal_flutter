import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'package:app_save_animals/models/region_model.dart';
import 'package:app_save_animals/providers/animals.dart';
import 'package:app_save_animals/widgets/grid_regions_widget.dart';

class AnimalsRegionScreen extends StatefulWidget {
  final RegionModel region;
  const AnimalsRegionScreen({Key? key, required this.region}) : super(key: key);

  @override
  State<AnimalsRegionScreen> createState() => _AnimalsRegionScreenState();
}

class _AnimalsRegionScreenState extends State<AnimalsRegionScreen> {
  Future? _obtainedEarlier;
  void onPressed(value) async {
    final String _url = 'https://www.google.com/search?q=${value.name}';
    if (!await launch(
      _url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) throw 'Could not launch $_url';
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
