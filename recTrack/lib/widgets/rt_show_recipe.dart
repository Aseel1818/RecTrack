import 'package:flutter/material.dart';
import '../screens/recipe_details_screen.dart';

///Show recipe class.
class RTShowRecipe extends StatefulWidget {
  final String label;
  final String image;
  final double calories;
  final double totalTime;
  final List ingredientLines;
  final List healthLabels;
  final List cuisineType;

  const RTShowRecipe(
      {super.key,
      required this.label,
      required this.image,
      required this.totalTime,
      required this.calories,
      required this.ingredientLines,
      required this.healthLabels,
      required this.cuisineType});

  @override
  RecipeDetailsScreen createState() => RecipeDetailsScreen();
}
