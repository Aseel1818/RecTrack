import 'package:flutter/material.dart';
import 'package:recptrack/model/recipe_model.dart';
import 'package:recptrack/widgets/rt_text.dart';
import '../api/search_recipe.dart';
import '../widgets/rt_show_recipe.dart';
import '../widgets/rt_internet_connection.dart';
import '../widgets/rt_result_not_found.dart';

class HomeSearchScreen extends StatefulWidget {
  final String url;

  const HomeSearchScreen({super.key, required this.url});

  @override
  HomeSearchScreenState createState() => HomeSearchScreenState();
}

class HomeSearchScreenState extends SearchRecipe {
  void _runRecipeFilter(String enteredKeyword) {
    List<RecipeModel> results = <RecipeModel>[];

    if (enteredKeyword.isEmpty) {
      results = list;
    } else {
      results = list
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

  @override
  void initState() {
    super.initState();
    final url = widget.url.toString();
    getApiData(url);
    foundRecipes = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: RTInternetConnection(),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, right: 3, bottom: 25, left: 3),
              child: TextField(
                onChanged: ((value) => ({
                      _runRecipeFilter(value),
                    })),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
                  border: OutlineInputBorder(
                    borderSide: (BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 7),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  hintText: 'Search recipes',
                ),
              ),
            ),
            Expanded(
              child: foundRecipes.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 200 / 130,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 20),
                      itemCount: foundRecipes.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RTShowRecipe(
                                            label: foundRecipes[index]
                                                .label
                                                .toString(),
                                            image: foundRecipes[index]
                                                .image
                                                .toString(),
                                            totalTime: foundRecipes[index]
                                                .totalTime
                                                .toDouble(),
                                            calories: foundRecipes[index]
                                                .calories
                                                .toDouble(),
                                            ingredientLines: foundRecipes[index]
                                                .ingredientLines
                                                .toList(),
                                            healthLabels: foundRecipes[index]
                                                .healthLabels
                                                .toList(),
                                            cuisineType: foundRecipes[index]
                                                .cuisineType
                                                .toList(),
                                          )));
                            },
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0))),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.srcOver),
                                        image: NetworkImage(foundRecipes[index]
                                            .image
                                            .toString()),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: RTText(
                                        text: foundRecipes[index]
                                            .label
                                            .toString(),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        size: 9.0,
                                      ),
                                    ))));
                      },
                    )
                  : RTResultNotFound(),
            )
          ],
        ),
      ),
    );
  }
}
