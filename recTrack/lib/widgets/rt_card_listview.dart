import 'package:flutter/material.dart';
import '../model/recipe_model.dart';
import 'rt_show_recipe.dart';
import 'rt_text.dart';
import 'rt_loading.dart';

///List view to show lunch recipes in home screen
class RTCardListView extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  final List<RecipeModel> listRecipeModel;
  const RTCardListView({super.key, required this.listRecipeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 5),
      child: listRecipeModel.isNotEmpty
          ? ListView.builder(
              itemCount: listRecipeModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RTShowRecipe(
                                  label: listRecipeModel[index].label.toString(),
                                  image: listRecipeModel[index].image.toString(),
                                  totalTime: listRecipeModel[index].totalTime.toDouble(),
                                  calories: listRecipeModel[index].calories.toDouble(),
                                  ingredientLines: listRecipeModel[index].ingredientLines.toList(),
                                  healthLabels: listRecipeModel[index].healthLabels.toList(),
                                  cuisineType: listRecipeModel[index].cuisineType.toList(),
                                )));
                  },
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Card(
                            elevation: 4,
                            shadowColor: Colors.teal,
                            margin: EdgeInsets.only(right: 20),
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0))),
                            child: Container(
                                margin: EdgeInsets.only(top: 7),
                                height: 120,
                                width: 260,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(maxWidth: 100),
                                          child: RTText(
                                            text: ' ${listRecipeModel[index].label.toString()}',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 35),
                                        width: circleRadius,
                                        height: circleRadius,
                                        child: Padding(
                                          padding: EdgeInsets.all(7),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(listRecipeModel[index].image.toString()),
                                            maxRadius: 70,
                                            minRadius: 65,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: EdgeInsets.only(left: 10),
                                      child: RTText(
                                        text: ' ${listRecipeModel[index].calories.round()} Cal',
                                        color: Colors.black,
                                        size: 13,
                                      )),
                                ])),
                          )),
                    ],
                  )),
            )
          : RTLoading(),
    );
  }
}
