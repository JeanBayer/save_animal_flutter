import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_save_animals/models/animals_model.dart';

class Animals with ChangeNotifier{

  List<AnimalsModel> _animal = [];
  List<AnimalsModel> get animal {
    return [..._animal];
  }

  Future<void> fetchAndSetAnimals() async {
    const token = "9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee";
    const url = "https://apiv3.iucnredlist.org/api/v3/species/category/cr?token=$token";

    final response = await http.get(Uri.parse(url));
    final extractedData = jsonDecode(response.body)["result"] as List<dynamic>;
    extractedData.forEach((element) { 
      _animal.add(AnimalsModel(id: element["taxonid"], name: element["scientific_name"]));
    });
    notifyListeners();
  }

}