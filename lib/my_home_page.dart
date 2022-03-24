import 'package:app_save_animals/providers/animals.dart';
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
        .fetchAndSetAnimals();
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
      appBar: AppBar(title: const Text("prueba")),
      body: FutureBuilder(
        future: _obtainedEarlier,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<Animals>(
              builder: (_, value, child) => ListView.builder(
                itemCount: value.animal.length,
                itemBuilder: (ctx, index) => Text("${value.animal[index].name}"),
              ),
            );
          }
        },
      ),
    );
  }
}
