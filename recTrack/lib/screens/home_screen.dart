import 'package:flutter/material.dart';
import '../constant/constants.dart';
import '../api/home_lists.dart';
import '../widgets/rt_show_recipe.dart';
import '../widgets/rt_card_listview.dart';
import '../widgets/rt_text.dart';
import '../widgets/rt_internet_connection.dart';
import '../widgets/rt_loading.dart';
import 'home_search_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends HomeLists {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;


  @override
  void initState() {
    super.initState();
    getApiLunchCategory(Constant.tenMinutesLunchRecipesURL,lunchRecipesList);
    getApiDietCategory();
    getApiVegCategory();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: RTInternetConnection(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 4.0, left: 4.0, top: 27.0, bottom: 4.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeSearchScreen(url: Constant.searchDataURL)));
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                  minimumSize: const Size.fromHeight(50),
                  alignment: Alignment.centerLeft,
                ),
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
                label: RTText(
                  text: 'Search for recipes',
                  color: Colors.grey,
                  size: 14,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 210),
              child: RTText(
                text: '10 min lunch recipes',
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 220,
              margin: EdgeInsets.only(top: 10),
              child: lunchRecipesList.isNotEmpty
                  ? ListView.builder(
                      itemCount: lunchRecipesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RTShowRecipe(
                                          label: lunchRecipesList[index]
                                              .label
                                              .toString(),
                                          image: lunchRecipesList[index]
                                              .image
                                              .toString(),
                                          totalTime: lunchRecipesList[index]
                                              .totalTime
                                              .toDouble(),
                                          calories: lunchRecipesList[index]
                                              .calories
                                              .toDouble(),
                                          ingredientLines:
                                          lunchRecipesList[index]
                                                  .ingredientLines
                                                  .toList(),
                                          healthLabels: lunchRecipesList[index]
                                              .healthLabels
                                              .toList(),
                                          cuisineType: lunchRecipesList[index]
                                              .cuisineType
                                              .toList(),
                                        )));
                          },
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: circleRadius / 2.0),
                                  child: Card(
                                    margin: EdgeInsets.only(right: 25),
                                    color: Colors.white60,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight:
                                                Radius.circular(15.0))),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 60, left: 10),
                                          height: 80,
                                          width: 150,
                                          child: Center(
                                            child: ConstrainedBox(
                                              constraints:
                                                  BoxConstraints(maxWidth: 130),
                                              child: RTText(
                                                text:
                                                    ' ${lunchRecipesList[index].label.toString()}',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Row(children: [
                                            Icon(Icons.timer_outlined),
                                            RTText(
                                              text:
                                                  ' ${lunchRecipesList[index].totalTime.toString()}',
                                              color: Colors.black,
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                width: circleRadius,
                                height: circleRadius,
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.white60),
                                child: Padding(
                                  padding: EdgeInsets.all(circleBorderWidth),
                                  child: DecoratedBox(
                                    decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                lunchRecipesList[index]
                                                    .image
                                                    .toString()))),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  : RTLoading(),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, right: 200),
              child: RTText(
                text: 'Balanced diet recipes',
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            RTCardListView(listRecipeModel: dietRecipesList),
            Container(
              margin: EdgeInsets.only(top: 12, right: 225),
              child: RTText(
                text: 'Vegetarian recipes',
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            RTCardListView(listRecipeModel: veganRecipesList),
          ],
        ),
      ),
    );
  }
}
