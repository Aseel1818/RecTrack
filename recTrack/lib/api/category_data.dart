import '../model/category_model.dart';

class CategoryData {
  final List<CategoryModel> _categoriesList = <CategoryModel>[
    CategoryModel(
        categoryName: 'Dishes',
        categoryImage: "assets/images/dish.png",
        categoryUrl:
            'https://api.edamam.com/search?q=dishes&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100'),
    CategoryModel(
        categoryName: 'Vegan',
        categoryUrl:
            'https://api.edamam.com/search?q=vegan&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100',
        categoryImage: "assets/images/vegan.png"),
    CategoryModel(
        categoryName: 'Breakfast',
        categoryUrl:
            "https://api.edamam.com/search?q=breakfast&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/breakfast.png"),
    CategoryModel(
        categoryName: 'Lunch',
        categoryImage: "assets/images/lunch.png",
        categoryUrl:
            "https://api.edamam.com/search?q=lunch&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100"),
    CategoryModel(
        categoryName: 'Dinner',
        categoryUrl:
            "https://api.edamam.com/search?q=dinner&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/dinners.png"),
    CategoryModel(
        categoryName: 'Salad',
        categoryUrl:
            "https://api.edamam.com/search?q=salad&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/salad.png"),
    CategoryModel(
        categoryName: 'Soup',
        categoryUrl:
            "https://api.edamam.com/search?q=soup&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/soup.png"),
    CategoryModel(
        categoryName: 'Juice',
        categoryUrl:
            "https://api.edamam.com/search?q=juice&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/juice.png"),
    CategoryModel(
        categoryName: 'Smoothie',
        categoryUrl:
            "https://api.edamam.com/search?q=smoothie&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/smoothie.png"),
    CategoryModel(
        categoryName: 'Pizza',
        categoryUrl:
            "https://api.edamam.com/search?q=pizza&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/pizza.png"),
    CategoryModel(
        categoryName: 'Burger',
        categoryUrl:
            "https://api.edamam.com/search?q=burger&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/burger.png"),
    CategoryModel(
        categoryName: 'Noodles',
        categoryUrl:
            "https://api.edamam.com/search?q=noodles&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/noodles.png"),
    CategoryModel(
        categoryName: 'Pasta',
        categoryUrl:
            "https://api.edamam.com/search?q=pasta&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/pasta.png"),
    CategoryModel(
        categoryName: 'Rice',
        categoryUrl:
            "https://api.edamam.com/search?q=rice&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/rice.png"),
    CategoryModel(
        categoryName: 'Chicken',
        categoryUrl:
            "https://api.edamam.com/search?q=chicken&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/chicken.png"),
    CategoryModel(
        categoryName: 'Meat',
        categoryUrl:
            "https://api.edamam.com/search?q=meat&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/meat.png"),
    CategoryModel(
        categoryName: 'Fish',
        categoryUrl:
            "https://api.edamam.com/search?q=fish&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/fish.png"),
    CategoryModel(
        categoryName: 'Sea Food',
        categoryUrl:
            "https://api.edamam.com/search?q=seafood&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/seafood.png"),
    CategoryModel(
        categoryName: 'Desserts',
        categoryUrl:
            "https://api.edamam.com/search?q=dessert&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/dessert.png"),
    CategoryModel(
        categoryName: 'Snacks',
        categoryUrl:
            "https://api.edamam.com/search?q=snacks&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/snack.png"),
    CategoryModel(
        categoryName: 'Cake',
        categoryUrl:
            "https://api.edamam.com/search?q=cake&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/cake.png"),
    CategoryModel(
        categoryName: 'Sweet',
        categoryUrl:
            "https://api.edamam.com/search?q=sweet&app_id=e8a795d5&app_key=41e48286d16532a4d043748ae1e96e9f&from=0&to=100",
        categoryImage: "assets/images/sweets.png"),
  ];

  List<CategoryModel> get categoriesList => _categoriesList;
}
