import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/recipe_model.dart';
import '../screens/home_search_screen.dart';

class SearchRecipe extends State<HomeSearchScreen> {
  List<RecipeModel> list = <RecipeModel>[];
  List<RecipeModel> foundRecipes = <RecipeModel>[];

  getApiData(String url) async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((element) {
      RecipeModel model = RecipeModel(
        image: element['recipe']['image'],
        label: element['recipe']['label'],
        totalTime: element['recipe']['totalTime'],
        calories: element['recipe']['calories'],
        ingredientLines: element['recipe']['ingredientLines'],
        healthLabels: element['recipe']['healthLabels'],
        cuisineType: element['recipe']['cuisineType'],
      );

      setState(() {
        list.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
