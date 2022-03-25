import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_save_animals/models/region_model.dart';
import 'package:app_save_animals/models/animals_model.dart';

class Animals with ChangeNotifier {
  List<AnimalsModel> _animal = [];
  List<AnimalsModel> get animal {
    return [..._animal];
  }

  List<RegionModel> _region = [];
  List<RegionModel> get region {
    return [..._region];
  }

  var token =
      "9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee";

  Future<void> fetchAndSetAnimals(String region) async {
    List<AnimalsModel> temp = [];
    final url =
        "https://apiv3.iucnredlist.org/api/v3/species/region/$region/page/0?token=$token";

    final response = await http.get(Uri.parse(url));
    final extractedData = jsonDecode(response.body)["result"] as List<dynamic>;
    extractedData.forEach((element) {
      temp.add(AnimalsModel(
          id: element["taxonid"], name: element["scientific_name"]));
    });
    temp.shuffle();
    _animal = temp.sublist(0, 20);
    notifyListeners();
  }

  Future<void> fetchAndSetRegions() async {
    List<RegionModel> temp = [];
    final url = "https://apiv3.iucnredlist.org/api/v3/region/list?token=$token";

    final response = await http.get(Uri.parse(url));
    final extractedData = jsonDecode(response.body)["results"] as List<dynamic>;
    extractedData.forEach((region) {
      temp.add(RegionModel(id: region["identifier"], name: region["name"]));
    });
    _region = temp;
    print(_region[0].name);
    notifyListeners();
  }
}
