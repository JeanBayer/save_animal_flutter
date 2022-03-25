import 'package:app_save_animals/providers/animals.dart';
import 'package:app_save_animals/screens/animals_region_screen.dart';
import 'package:app_save_animals/widgets/animal_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    // TODO: implement initState
    super.initState();
    _obtainedEarlier = _runFuture();
    print("entré");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        title: Text("Save animals"),
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
                builder: (_, value, child) => GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: value.region.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AnimalsRegionScreen(
                                region: value.region[i],
                              ),
                            ),
                          );
                        },
                        child: AnimalCardWidget(name: value.region[i].name));
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
