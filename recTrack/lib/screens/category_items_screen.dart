import 'package:flutter/material.dart';
import 'package:recptrack/widgets/rt_text.dart';
import '../api/search_category_data.dart';
import '../widgets/rt_show_recipe.dart';
import '../widgets/rt_internet_connection.dart';
import '../widgets/rt_result_not_found.dart';

class CategoryItemsScreen extends StatefulWidget {
  final String url;
  final String name;

  const CategoryItemsScreen({super.key, required this.url, required this.name});

  @override
  CategoryItemsScreenState createState() => CategoryItemsScreenState();
}

class CategoryItemsScreenState extends SearchCategoryData {
  @override
  void initState() {
    super.initState();
    final url = widget.url.toString();
    getApiSearchCategData(url);
    foundRecipes = listOfSearchScreenData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RTText(
          text: "Recent ${widget.name} recipes",
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RTInternetConnection(),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
              child: SizedBox(
                height: 50,
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  onChanged: ((value) => ({
                        runRecipeFilter(value),
                      })),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: (BorderSide(color: Colors.grey)),
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
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 7, vertical: 16)),
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
                                      padding: EdgeInsets.only(left: 7),
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
