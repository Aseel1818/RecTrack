import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recptrack/model/recipe_model.dart';
import 'package:http/http.dart' as http;
import '../screens/category_items_screen.dart';

class SearchCategoryData extends State<CategoryItemsScreen> {
  List<RecipeModel> listOfSearchScreenData = <RecipeModel>[];
  List<RecipeModel> foundRecipes = <RecipeModel>[];

  void runRecipeFilter(String enteredKeyword) {
    List<RecipeModel> results = <RecipeModel>[];

    if (enteredKeyword.isEmpty) {
      results = listOfSearchScreenData;
    } else {
      results = listOfSearchScreenData
          .where((recipe) => recipe.label
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundRecipes = results;
    });
  }

  getApiSearchCategData(String url) async {
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
        listOfSearchScreenData.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
