class RecipeModel {
  final String image, label;
  final List ingredientLines, healthLabels, cuisineType;
  final double totalTime, calories;

  RecipeModel(
      {required this.image,
        required this.label,
        required this.totalTime,
        required this.ingredientLines,
        required this.calories,
        required this.healthLabels,
        required this.cuisineType});
}
