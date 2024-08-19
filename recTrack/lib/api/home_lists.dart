import 'dart:convert';
import '../constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:recptrack/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class HomeLists extends State {
  List<RecipeModel> lunchRecipesList = <RecipeModel>[];

  getApiLunchCategory(url,list) async {
    var response =
        await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((element) {
      RecipeModel modelLunch = RecipeModel(
        image: element['recipe']['image'],
        label: element['recipe']['label'],
        totalTime: element['recipe']['totalTime'],
        calories: element['recipe']['calories'],
        ingredientLines: element['recipe']['ingredientLines'],
        healthLabels: element['recipe']['healthLabels'],
        cuisineType: element['recipe']['cuisineType'],
      );
       setState(() {
         list.add(modelLunch);
       });
    });
  }

  List<RecipeModel> dietRecipesList = <RecipeModel>[];

  getApiDietCategory() async {
    var response = await http.get(Uri.parse(Constant.balanceDietRecipesURL));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((element) {
      RecipeModel modelDiet = RecipeModel(
        image: element['recipe']['image'],
        label: element['recipe']['label'],
        totalTime: element['recipe']['totalTime'],
        calories: element['recipe']['calories'],
        ingredientLines: element['recipe']['ingredientLines'],
        healthLabels: element['recipe']['healthLabels'],
        cuisineType: element['recipe']['cuisineType'],
      );
      setState(() {
         dietRecipesList.add(modelDiet);
      });
    });
  }

  List<RecipeModel> veganRecipesList = <RecipeModel>[];

  getApiVegCategory() async {
    var response = await http.get(Uri.parse(Constant.veganRecipesURL));
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
         veganRecipesList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
