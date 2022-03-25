import 'package:app_save_animals/screens/animals_region_screen.dart';
import 'package:app_save_animals/widgets/grid_regions_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_save_animals/providers/animals.dart';
import 'package:app_save_animals/widgets/carousel_header_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future? _obtainedEarlier;
  Future _runFuture() async {
    return await Provider.of<Animals>(context, listen: false)
        .fetchAndSetRegions();
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
        title: const Text("Save animals"),
      ),
      body: FutureBuilder(
        future: _obtainedEarlier,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else {
            return Consumer<Animals>(
              builder: (_, value, child) => SingleChildScrollView(
                child: Column(
                  children: [
                    const CarrouselHeaderWidget(),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GridRegionsWidgets(
                        data: value.region,
                        withScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
